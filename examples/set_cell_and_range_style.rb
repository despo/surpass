require "lib/surpass"

w = Workbook.new("set_cell_style.xls")
s = w.add_sheet

s.write_arrays([%w{a b c d e}, %w{F G H I J}, %w{k l m n o}])

s.set_cell_style(2, 2, StyleFormat.new(:font_color => "yellow"))
s.set_range_style(0..1, 1..2, StyleFormat.new(:font_color => "purple"))

w.save
