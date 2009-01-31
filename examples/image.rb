require "lib/surpass"


w = Workbook.new
ws = w.add_sheet('Image')
ws.insert_bitmap('examples/python.bmp', 2, 2)
ws.insert_bitmap('examples/python.bmp', 10, 2)

w.save('image.xls')
