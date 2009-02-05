require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet

ws.write(0, 0, 1)
ws.write(1, 0, 1.23)
ws.write(2, 0, 12345678)
ws.write(3, 0, 123456.78)

ws.write(0, 1, -1)
ws.write(1, 1, -1.23)
ws.write(2, 1, -12345678)
ws.write(3, 1, -123456.78)

ws.write(0, 2, -17867868678687.0)
ws.write(1, 2, -1.23e-5)
ws.write(2, 2, -12345678.90780980)
ws.write(3, 2, -123456.78)

book.save(__FILE__.gsub(/rb$/, "xls"))
