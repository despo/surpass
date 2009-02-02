class Cell
  attr_reader :index
  
  def set_style(style_format)
    @format_index = @parent.parent_wb.styles.add(style_format)
  end
end

class StringCell < Cell
  def initialize(parent, index, format_index, sst_index)
    @parent = parent
    @index = index
    @format_index = format_index
    @sst_index = sst_index
  end
  
  def to_biff
    LabelSSTRecord.new(@parent.index, @index, @format_index, @sst_index).to_biff
  end
end

class BlankCell < Cell
  def initialize(parent, index, format_index)
    @parent = parent
    @index = index
    @format_index = format_index
  end
  
  def to_biff
    BlankRecord.new(@parent.index, @index, @format_index).to_biff
  end
end

class NumberCell < Cell
  def initialize(parent, index, format_index, number)
    @parent = parent
    @index = index
    @format_index = format_index
    @number = number
  end
  
  def rk_record(rk_encoded)
    RKRecord.new(@parent.index, @index, @format_index, rk_encoded).to_biff
  end
  
  # TODO test this section to be sure numbers are categorized and packed correctly.
  def to_biff
    # 30 bit signed int
    in_range = (-0x20000000 <= @number) && (@number < 0x20000000)
    is_int = (@number.to_i == @number)
    if in_range && is_int
      rk_encoded = 2 | (@number.to_i << 2)
      return rk_record(rk_encoded)
    end
    
    # try scaling by 100 then using a 30 bit signed int
    in_range = (-0x20000000 <= @number * 100) && (@number * 100 < 0x20000000)
    round_trip = (@number.to_i*100) == @number*100
    if in_range && round_trip
      rk_encoded = (3 | (@number.to_i*100 << 2))
      return rk_record(rk_encoded)
    end
    
    w0, w1, w2, w3 = [@number].pack('E').unpack('v4')
    
    is_float_rk = (w0 == 0) && (w1 == 0) && (w2 & 0xFFFC) == w2
    if is_float_rk
      rk_encoded = (w3 << 16) | w2
      return rk_record(rk_encoded)
    end
    
    w0, w1, w2, w3 = [@number * 100].pack('E').unpack('v4')

    is_float_rk_100 = w0 == 0 && w1 == 0 && w2 & 0xFFFC == w2
    if is_float_rk_100
      rk_encoded = 1 | (w3 << 16) | w2
      return rk_record(rk_encoded)
    end

    # If not an RK value, use a NumberRecord instead.
    NumberRecord.new(@parent.index, @index, @format_index, @number).to_biff
  end
end

class MulNumberCell < Cell
  def initialize(parent, index, format_index, sst_index)
    @parent = parent
    @index = index
    @format_index = format_index
    @sst_index = sst_index
  end
  
  def to_biff
    raise "not implemented"
  end
end

class MulBlankCell < Cell
  def initialize(parent, col1, col2, xf_idx)
    raise unless col1 < col2
    @parent = parent
    @col1 = col1
    @col2 = col2
    @xf_idx = xf_idx
  end
  
  def to_biff
    MulBlankRecord.new(@parent.index, @col1, @col2, @xf_idx).to_biff
  end
end

class FormulaCell < Cell
  attr_accessor :result
  
  def initialize(parent, index, format_index, formula, calc_flags = 0)
    @str = nil
    @parent = parent
    @index = index
    @format_index = format_index
    @options = formula.options.nil? ? parent.formula_options : formula.options
    @formula = formula
    @result = convert_formula_value_to_result(formula.default)
    @calc_flags = calc_flags
  end
  
  def to_biff
    args = [@parent.index, @index, @format_index, @result, @options, @formula.rpn, @calc_flags]
    formula_data = FormulaRecord.new(*args).to_biff
    formula_data += StringRecord.new(@str).to_biff if @str
    formula_data
  end
  
  # TODO move this elsewhere, either Utilities or Formula ?
  def convert_formula_value_to_result(value)
    @str = ''
    if value.is_a?(Numeric)
      ret = [value].pack('E')
    else
      case value
      when TrueClass, FalseClass
        ret = [0x01, value ? 0x01 : 0x00].pack('CxC3x') 
      when ErrorCode
        ret = [0x02, value.to_i].pack('CxC3x') 
      when String
        ret = [0x00, 'Cx5']
        @str = value # TODO convert to unicode
      when NilClass
        ret = [0x03, 'Cx5']
      else
        raise
      end
      ret += [0xFFFF].pack('C')
    end
    ret.unpack('Q')[0]
  end
end


class BooleanCell < Cell
  def initialize(parent, index, format_index, number)
    @parent = parent
    @index = index
    @format_index = format_index
    @number = number
    @is_error = 0
  end
  
  def to_biff
    BoolErrRecord.new(@parent.index, @index, @format_index, @number, @is_error)
  end
end

class ErrorCell < Cell
  ERROR_CODES = {
      0x00 =>  0, # Intersection of two cell ranges is empty
      0x07 =>  7, # Division by zero
      0x0F => 15, # Wrong type of operand
      0x17 => 23, # Illegal or deleted cell reference
      0x1D => 29, # Wrong function or range name
      0x24 => 36, # Value range overflow
      0x2A => 42, # Argument or function not available
      '#NULL!'  =>  0, # Intersection of two cell ranges is empty
      '#DIV/0!' =>  7, # Division by zero
      '#VALUE!' => 36, # Wrong type of operand
      '#REF!'   => 23, # Illegal or deleted cell reference
      '#NAME?'  => 29, # Wrong function or range name
      '#NUM!'   => 36, # Value range overflow
      '#N/A!'   => 42  # Argument or function not available
  }
  
  def initialize(parent, index, format_index, error_string_or_code)
    @parent = parent
    @index = index
    @format_index = format_index
    @number = ERROR_CODES[error_string_or_code]
    @is_error = 1
    
    raise "invalid error code #{error_string_or_code}" if @number.nil?
  end
  
  def to_biff
    BoolErrRecord.new(@parent.index, @index, @format_index, @number, @is_error)
  end
end
