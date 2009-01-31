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

0.upto(0x53) do |i|
    borders = Borders.new
    borders.left = i
    borders.right = i
    borders.top = i
    borders.bottom = i

    style = StyleFormat.new
    style.borders = borders

    ws0.write(i, 2, '', style)
    ws0.write(i, 3, hex(i), style0)
end

ws0.write_merge(5, 8, 6, 10, "")

wb.save('blanks.xls')