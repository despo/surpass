require "rubygems"
require "surpass"

book = Workbook.new
s = book.add_sheet

s.write_arrays(0, 0, [%w{a b c d e}, %w{F G H I J}, %w{k l m n o}])

s.set_cell_style(2, 2, StyleFormat.new(:font_color => "yellow"))
s.set_range_style(0..1, 1..2, StyleFormat.new(:font_color => "purple"))

book.save(__FILE__.gsub(/rb$/, "xls"))