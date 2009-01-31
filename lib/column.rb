class Column
  attr_accessor :index
  attr_accessor :width
  attr_accessor :hidden
  attr_accessor :level
  attr_accessor :collapse
  
  def initialize(index, parent)
    @index = index
    @parent = parent
    @parent_wb = parent.parent
    @xf_index = 0x0F
    
    @width = 0x0B92
    @hidden = 0
    @level = 0
    @collapse = 0
  end
  
  def to_biff
    options =  (@hidden & 0x01) << 0
    options |= (@level & 0x07) << 8
    options |= (@collapse & 0x01) << 12
    
    ColInfoRecord.new(@index, @index, @width, @xf_index, options).to_biff
  end
  
  def set_style(style)
    @xf_index = @parent_wb.add_style(style)
  end
end
