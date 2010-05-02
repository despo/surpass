require "rubygems"
require "surpass"


book = Workbook.new
sheet = book.add_sheet('Image')
sheet.set_column_width(2, 20)
sheet.insert_bitmap('examples/python.bmp', 2, 2)
sheet.insert_bitmap('examples/python.bmp', 15, 0)
book.save(__FILE__.gsub(/rb$/, "xls"))
