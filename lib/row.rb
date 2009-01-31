class Row
  attr_accessor :index
  attr_accessor :parent
  attr_accessor :parent_wb
  attr_accessor :cells
  attr_accessor :min_col_index
  attr_accessor :max_col_index
  attr_accessor :total_str
  attr_accessor :xf_index
  attr_accessor :has_default_format
  attr_accessor :height_in_pixels
  
  attr_accessor :height
  attr_accessor :has_default_height
  attr_accessor :level
  attr_accessor :collapse
  attr_accessor :hidden
  attr_accessor :space_above
  attr_accessor :space_below

  def initialize(index, parent_sheet)
    @index = index
    @parent = parent_sheet
    @parent_wb = parent_sheet.parent()
    @cells = []
    @min_col_index = 0
    @max_col_index = 0
    @total_str = 0
    @xf_index = 0x0F
    @has_default_format = 0
    @height_in_pixels = 0x11
    
    @height = 0x00FF
    @has_default_height = 0x01
    @level = 0
    @collapse = 0
    @hidden = 0
    @space_above = 0
    @space_below = 0
  end
  
  def adjust_height(style)
    twips = style.font.height
    points = twips/20.0
    # Cell height in pixels can be calcuted by following approx. formula:
    # cell height in pixels = font height in points * 83/50 + 2/5
    # It works when screen resolution is 96 dpi 
    pix = (points*83.0/50.0 + 2.0/5.0).round
    @height_in_pixels = pix if (pix > @height_in_pixels)
  end
  
  def adjust_boundary_column_indexes(*args)
    args.each do |a|
      @min_col_index = a if a < @min_col_index
      @max_col_index = a if a > @max_col_index
    end
  end
  
  def style=(style)
    adjust_height(style)
    @xf_index = @parent_wb.styles.add(style)
  end
  
  def cells_count
    @cells.length
  end
  
  def to_biff
    height_options = (@height & 0x07FFF)
    height_options |= (@has_default_height & 0x01) << 15
    
    options =  (@level & 0x07) << 0
    options |= (@collapse & 0x01) << 4
    options |= (@hidden & 0x01) << 5
    options |= (0x00 & 0x01) << 6
    options |= (0x01 & 0x01) << 8
    if @xf_index != 0x0F
      options |= (0x01 & 0x01) << 7
    else
      options |= (0x00 & 0x00) << 7
    end
    options |= (@xf_index & 0x0FFF) << 16
    options |= (0x00 & @space_above) << 28
    options |= (0x00 & @space_below) << 29

    args = [@index, @min_col_index, @max_col_index, height_options, options]
    RowRecord.new(*args).to_biff
  end
  
  def cells_biff
    cells.collect {|c| c.to_biff }.join
  end
  
  def write(col, label, style)
    adjust_height(style)
    adjust_boundary_column_indexes(col)
    case label
    when String
      if label.length > 0
        @cells << StringCell.new(self, col, @parent_wb.styles.add(style), @parent_wb.sst.add_str(label))
        @total_str += 1
      else
        @cells << BlankCell.new(self, col, @parent_wb.styles.add(style))
      end
    when Numeric
      @cells << NumberCell.new(self, col, @parent_wb.styles.add(style), label)
    when Date, DateTime, Time
      @cells << NumberCell.new(self, col, @parent_wb.styles.add(style), as_excel_date(label))
    when ExcelFormula
      @cells << FormulaCell.new(self, col, @parent_wb.styles.add(style), label)
    else
      raise label.class.name
    end
  end
  
  def write_blanks(c1, c2, style)
    adjust_height(style)
    adjust_boundary_column_indexes(c1, c2)
    @cells << MulBlankCell.new(self, c1, c2, @parent_wb.styles.add(style))
  end
end