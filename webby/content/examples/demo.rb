# require 'rubygems'
# require 'surpass'

require '../lib/surpass'

book = Workbook.new("output/examples/demo.xls") # You can pass a filename here too.
sheet = book.add_sheet("Demo Worksheet") # You can name your worksheets.

# Let's set up some formatting.

# Remember to use Excel-style formatting directives, not sprintf.
date_format = StyleFormat.new(:number_format_string => "DDDD DD MMM YYYY")

fancy_format = StyleFormat.new(
  :font_name => 'Times New Roman', 
  :font_colour => 'green',
  :font_italic => true
)

sheet.write(0, 0, "Hello World!", fancy_format)
sheet.write(0, 1, Date.today, date_format)

# You can also set up formatting by passing attributes directly to the constituents of StyleFormat

# Font colours.
Formatting::COLOURS.keys.each_with_index do |c, i|
  format = StyleFormat.new
  format.font.name = 'Verdana'
  format.font.color = c
  format.font.size = i + 5
  sheet.write(i, 5, c, format)
end

# Font underlining.

[:none, :single, :single_accounting, :double, :double_accounting, nil, true, false].each_with_index do |u, i|
  format = StyleFormat.new
  format.font.underline = u
  sheet.write(i, 7, u.to_s, format)
end

# Font bold, italic, strikethrough, outline are simple booleans.
[:bold, :italic, :struck_out, :outline].each_with_index do |s, i|
  attribute = ("font_" + s.to_s).to_sym
  sheet.write(i, 8, s.to_s, StyleFormat.new(attribute => true))
end

# Cell alignment.
sheet.write(15, 2, "top left", StyleFormat.new(:text_align => 'top left'))
sheet.write(15, 3, "top center", StyleFormat.new(:text_align => 'top center'))
sheet.write(15, 4, "top right", StyleFormat.new(:text_align => 'top right'))
sheet.write(16, 2, "bottom left", StyleFormat.new(:text_align => 'bottom left'))
sheet.write(16, 3, "bottom centre", StyleFormat.new(:text_align => 'bottom centre'))
sheet.write(16, 4, "bottom right", StyleFormat.new(:text_align => 'bottom right'))

# Borders

sheet.write(3, 1, "borders", StyleFormat.new(
  :border_right => 'medium blue',
  :border_left => 'thin yellow',
  :border_top => 'dotted purple',
  :border_bottom => 'dashed pink'
))

sheet.write(5, 1, "borders", StyleFormat.new(
  :border_all => 'slanted-medium-dash-dotted green'
))

sheet.write(7, 1, "fill", StyleFormat.new(:fill_color => 'yellow'))

book.save
