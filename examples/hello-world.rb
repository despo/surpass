require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet

ws.write(0, 0, "Hello World")

book.save(__FILE__.gsub(/rb$/, "xls"))
