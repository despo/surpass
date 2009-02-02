require "lib/surpass"

fmt = StyleFormat.new({:font_colour => 'purple', :font_italic => true, :font_bold => true, :font_name => "Times New Roman"})

w = Workbook.new("named-colours-test.xls")
s = w.add_sheet

s.write(0, 0, "hey!", fmt)

w.save
