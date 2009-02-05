require "rubygems"
require "surpass"

book = Workbook.new
ws0 = book.add_sheet


fnt = Font.new
fnt.name = 'Arial'
fnt.colour_index = 4
fnt.bold = true

borders = Borders.new
borders.left = 6
borders.right = 6
borders.top = 6
borders.bottom = 6

style = StyleFormat.new
style.font = fnt
style.borders = borders

ws0.write_merge(3, 3, 1, 5, 'test1', style)
ws0.write_merge(4, 10, 1, 5, 'test2', style)
ws0.set_column_width(1, 0x0d00)

book.save(__FILE__.gsub(/rb$/, "xls"))