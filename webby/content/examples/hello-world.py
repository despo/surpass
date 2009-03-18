from xlwt import *

book = Workbook()
sheet = book.add_sheet("Sheet1")

sheet.write(0, 0, "Hello World!")

book.save("output/examples/hello-world-python.xls")
