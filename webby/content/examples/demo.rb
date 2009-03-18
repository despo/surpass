require 'rubygems'
require 'surpass'

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
# You can pass a hash of style attributes directly to sheet.write, but 
# remember this creates a new StyleFormat object each time, so don't
# do this if you are going to re-use a style for multiple cells. If you
# are going to use a format more than once, then create a StyleFormat and
# pass a reference to that.
sheet.write(15, 2, "top left", :text_align => 'top left', :border_top => 'pink', :border_left => 'pink')
sheet.write(15, 3, "top center", :text_align => 'top center')
sheet.write(15, 4, "top right", :text_align => 'top right')
sheet.write(16, 2, "bottom left", :text_align => 'bottom left')
sheet.write(16, 3, "bottom centre", :text_align => 'bottom centre')
sheet.write(16, 4, "bottom right", :text_align => 'bottom right', :border_bottom => 'pink', :border_right => 'pink')


# Borders
sheet.write(3, 1, "borders",
  :border_right => 'medium blue',
  :border_left => 'thin yellow',
  :border_top => 'dotted purple',
  :border_bottom => 'dashed pink'
)

# Or the hash-free option.
crazy_border_format = StyleFormat.new
crazy_border_format.borders.all = 'slanted-medium-dash-dotted grey'

sheet.write(5, 1, "borders", crazy_border_format)

sheet.write(7, 1, "fill", :fill_color => 'yellow')

book.save
