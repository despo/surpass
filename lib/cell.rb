class StringCell
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

class BlankCell
  def initialize(parent, index, format_index)
    @parent = parent
    @index = index
    @format_index = format_index
  end
  
  def to_biff
    BlankRecord.new(@parent.index, @index, @format_index).to_biff
  end
end

class NumberCell
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
    
    w0, w1, w2, w3 = [@number].pack('d').unpack('S4')
    
    is_float_rk = (w0 == 0) && (w1 == 0) && (w2 & 0xFFFC) == w2
    if is_float_rk
      rk_encoded = (w3 << 16) | w2
      return rk_record(rk_encoded)
    end
    
    w0, w1, w2, w3 = [@number * 100].pack('d').unpack('S4')

    is_float_rk_100 = w0 == 0 && w1 == 0 && w2 & 0xFFFC == w2
    if is_float_rk_100
      rk_encoded = 1 | (w3 << 16) | w2
      return rk_record(rk_encoded)
    end

    # If not an RK value, use a NumberRecord instead.
    NumberRecord.new(@parent.index, @index, @format_index, @number).to_biff
  end
end

class MulNumberCell
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

class MulBlankCell
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

class FormulaCell
  attr_accessor :result
  
  def initialize(parent, index, format_index, formula)
    @str = nil
    @parent = parent
    @index = index
    @format_index = format_index
    @options = formula.options.nil? ? parent.formula_options : formula.options
    @formula = formula
    @result = convert_formula_value_to_result(formula.default)
  end
  
  def to_biff
    args = [@parent.index, @index, @format_index, @result, @options, @formula.rpn]
    formula_data = FormulaRecord.new(*args).to_biff
    formula_data += StringRecord.new(@str).to_biff if @str
    formula_data
  end
  
  # TODO move this elsewhere, either Utilities or Formula ?
  def convert_formula_value_to_result(value)
    @str = ''
    if value.is_a?(Numeric)
      ret = [value].pack('d')
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