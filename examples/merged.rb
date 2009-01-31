require "lib/surpass"

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


wb = Workbook.new
ws0 = wb.add_sheet('sheet0')
ws1 = wb.add_sheet('sheet1')
ws2 = wb.add_sheet('sheet2')

(0...0x200).step(2) do |i|
  ws0.write_merge(i, i+1, 1, 5, "test #{i}", style)
  ws1.write_merge(i, i, 1, 7, "test #{i}", style)
  ws2.write_merge(i, i+1, 1, 7 + (i%10), "test #{i}", style)
end

wb.save('merged.xls')