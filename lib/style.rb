class StyleFormat
  attr_accessor :number_format_string
  attr_accessor :font
  attr_accessor :alignment
  attr_accessor :borders
  attr_accessor :pattern
  attr_accessor :protection
  
  def initialize
    @number_format_string = 'general'
    @font           = Font.new # TODO should this look for an existing StyleCollection and pull its @fonts[0]?
    @alignment      = Alignment.new
    @borders        = Borders.new
    @pattern        = Pattern.new
    @protection     = Protection.new
  end
end

class StyleCollection
  attr_accessor :fonts
  attr_accessor :number_formats
  attr_accessor :styles
  attr_accessor :default_style
  attr_accessor :default_format
  
  STANDARD_NUMBER_FORMATS = [
    'general',
    '0',
    '0.00',
    '#,##0',
    '#,##0.00',
    '"$"#,##0_);("$"#,##',
    '"$"#,##0_);[Red]("$"#,##',
    '"$"#,##0.00_);("$"#,##',
    '"$"#,##0.00_);[Red]("$"#,##',
    '0%',
    '0.00%',
    '0.00E+00',
    '# ?/?',
    '# ??/??',
    'M/D/YY',
    'D-MMM-YY',
    'D-MMM',
    'MMM-YY',
    'h:mm AM/PM',
    'h:mm:ss AM/PM',
    'h:mm',
    'h:mm:ss',
    'M/D/YY h:mm',
    '_(#,##0_);(#,##0)',
    '_(#,##0_);[Red](#,##0)',
    '_(#,##0.00_);(#,##0.00)',
    '_(#,##0.00_);[Red](#,##0.00)',
    '_("$"* #,##0_);_("$"* (#,##0);_("$"* "-"_);_(@_)',
    '_(* #,##0_);_(* (#,##0);_(* "-"_);_(@_)',
    '_("$"* #,##0.00_);_("$"* (#,##0.00);_("$"* "-"??_);_(@_)',
    '_(* #,##0.00_);_(* (#,##0.00);_(* "-"??_);_(@_)',
    'mm:ss',
    '[h]:mm:ss',
    'mm:ss.0',
    '##0.0E+0',
    '@'   
  ]
  
  def initialize
    # Populate default font list.
    @fonts = {}
    # Initialize blank fonts into slots 0,1,2,3,5 in order to skip slot 4.
    [0,1,2,3,5].each do |i|
      @fonts[i] = Font.new
    end
    
    # Populate default number format list.
    @number_formats = {}
    STANDARD_NUMBER_FORMATS.each_with_index do |s, i|
      index = (i <= 23) ? i : i + 14
      @number_formats[index] = s
    end
    
    @styles = {}
    @default_style = StyleFormat.new
    
    # Store the 6 parameters of the default_style
    @default_format = add_style(@default_style)[0]
  end
  
  def add(style)
    if style.nil?
      0x10 # Return the index of the default style.
    else
      add_style(style)[1] # Return the index of the style just stored.
    end
  end
  
  def number_format_index(number_format_string)
    if !@number_formats.has_value?(number_format_string)
      # TODO implement regex to check if valid string
      new_index = 163 + @number_formats.length - STANDARD_NUMBER_FORMATS.length
      @number_formats[new_index] = number_format_string
    end
    @number_formats.index(number_format_string)
  end
  
  def font_index(font)
    if !@fonts.has_value?(font)
      new_index = @fonts.length + 1
      @fonts[new_index] = font
    end
    @fonts.index(font)
  end
  
  def format_index(format)
    if !@styles.has_value?(format)
      new_index = 0x10 + @styles.length
      @styles[new_index] = format
    end
    @styles.index(format)
  end
  
  private
  # This is private, please use add(style) instead.
  def add_style(style)
    number_format_index = number_format_index(style.number_format_string)
    font_index = font_index(style.font)
    
    format = [font_index, number_format_index, style.alignment, style.borders, style.pattern, style.protection]
    [format, format_index(format)]
  end
  
  public
  def to_biff
    fonts_biff + number_formats_biff + cell_styles_biff + StyleRecord.new.to_biff
  end
  
  # TODO use inject here?
  def fonts_biff
    result = ''
    @fonts.sort.each do |i, f|
      result += f.to_biff
    end
    result
  end
  
  def number_formats_biff
    result = ''
    @number_formats.sort.each do |i, f|
      next if i < 163
      result += NumberFormatRecord.new(i, f).to_biff
    end
    result
  end
  
  def cell_styles_biff
    result = ''
    0.upto(15) do |i|
      result += XFRecord.new(@default_format, 'style').to_biff
    end
    @styles.sort.each do |i, f|
      result += XFRecord.new(f).to_biff
    end
    result
  end
end
