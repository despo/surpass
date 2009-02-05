require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet('Hey, Dude')

(6...80).each do |i|
    fnt = Font.new
    fnt.height = i*20
    style = StyleFormat.new
    style.font = fnt
    ws.write(1, i, 'Test')
    ws.set_column_width(i, i)
end

book.save(__FILE__.gsub(/rb$/, "xls"))