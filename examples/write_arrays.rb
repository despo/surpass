require "lib/surpass"

font0 = Font.new
font0.name = 'Times New Roman'

style0 = StyleFormat.new
style0.font = font0


wb = Workbook.new
s = wb.add_sheet

s.write_array_to_column(methods.sort, 0, 0, style0)

wb.save('examples/arrays.xls')