require "lib/surpass"

font0 = Font.new
font0.name = 'Times New Roman'
font0.struck_out = true
font0.bold = true

style0 = StyleFormat.new
style0.font = font0


wb = Workbook.new
ws0 = wb.add_sheet('0')

ws0.write(1, 1, 'Test', style0)

(0...0x53).each do |i|
  fnt = Font.new
  fnt.name = 'Arial'
  fnt.colour_index = i
  fnt.outline = true

  borders = Borders.new
  borders.left = i

  style = StyleFormat.new
  style.font = fnt
  style.borders = borders

  ws0.write(i, 2, 'colour', style)
  ws0.write(i, 3, hex(i), style0)
end

wb.save('format.xls')