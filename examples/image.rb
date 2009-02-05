require "rubygems"
require "surpass"


book = Workbook.new
ws = book.add_sheet('Image')
ws.insert_bitmap('examples/python.bmp', 2, 2)
ws.insert_bitmap('examples/python.bmp', 10, 2)

book.save(__FILE__.gsub(/rb$/, "xls"))
