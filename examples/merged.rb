require "rubygems"
require "surpass"

fnt = Font.new
fnt.name = 'Arial'
fnt.colour_index = 4
fnt.bold = true

borders = Borders.new
borders.left = 6
borders.right = 6
borders.top = 6
borders.bottom = 6

al = Alignment.new
al.horz = Alignment::HORZ_CENTER
al.vert = Alignment::VERT_CENTER

style = StyleFormat.new
style.font = fnt
style.borders = borders
style.alignment = al


book = Workbook.new
ws0 = book.add_sheet
ws1 = book.add_sheet
ws2 = book.add_sheet

(0...0x200).step(2) do |i|
  ws0.write_merge(i, i+1, 1, 5, "test #{i}", style)
  ws1.write_merge(i, i, 1, 7, "test #{i}", style)
  ws2.write_merge(i, i+1, 1, 7 + (i%10), "test #{i}", style)
end

book.save(__FILE__.gsub(/rb$/, "xls"))