require 'lib/surpass'

book = Workbook.new
ws = book.add_sheet

top_align = StyleFormat.new(:text_align => 'top')
bottom_align = StyleFormat.new(:text_align => 'bottom')

(10..40).each do |i|
  ws.write(i-10, 0, i)
  ws.write(i-10, 1, 'top', top_align)
  ws.write(i-10, 2, 'bottom', bottom_align)

  ws.row(i-10).set_height i
end

book.save(__FILE__.gsub(/rb$/, "xls"))
