require "rubygems"
require "surpass"

style0 = StyleFormat.new(:font_name => 'Times New Roman', :font_struck_out => true, :font_bold => true)

book = Workbook.new
ws0 = book.add_sheet('0')

ws0.write(1, 1, 'Test', style0)

(0...14).each do |i|
  style = StyleFormat.new(:font_name => 'Arial', :font_color_index => i, :font_outline => true)

  borders = Borders.new
  borders.left = i

  style.borders = borders

  ws0.write(i, 2, 'colour', style)
  ws0.write(i, 3, hex(i), style0)
end

book.save(__FILE__.gsub(/rb$/, "xls"))