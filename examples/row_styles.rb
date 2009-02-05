require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet

(6..80).each do |i|
  fnt = Font.new
  fnt.height = i*20
  style = StyleFormat.new
  style.font = fnt
  ws.write(i, 1, 'Test')
  ws.row(i).style = style
end

book.save(__FILE__.gsub(/rb$/, "xls"))
