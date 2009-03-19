require 'rubygems'
require 'surpass'

book = Workbook.new(__FILE__.gsub(/rb$/, "xls"))
sheet = book.add_sheet("Colours") # You can name your worksheets.

per_row = 20

Formatting::COLOURS.keys.each_with_index do |c, i|
  format = StyleFormat.new
  format.pattern.color = c
  row = i % per_row
  color_column = (i/per_row)*2
  label_column = (i/per_row)*2 + 1
  
  sheet.write(row, color_column, nil, :fill_color => c)
  sheet.write(row, label_column,  c, :font_size => 16)
  
  sheet.set_column_width(color_column, 3)
  sheet.set_column_width(label_column, 30)
end

book.save
