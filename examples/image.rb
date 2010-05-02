require "rubygems"
require "surpass"

# TODO As this example shows, there is a bug in the size calculation somewhere.

book = Workbook.new
sheet = book.add_sheet('Image')
sheet.set_column_width(2, 20)
sheet.insert_bitmap('examples/python.bmp', 2, 2)
sheet.insert_bitmap('examples/python.bmp', 15, 0)
book.save(__FILE__.gsub(/rb$/, "xls"))
