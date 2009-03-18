from xlwt import *
from datetime import datetime

book = Workbook()
sheet = book.add_sheet("Demo Worksheet")

# Let's set up some formatting.

# Remember to use Excel-style formatting directives, not sprintf.

date_format = XFStyle()
date_format.num_format_str = "DDDD DD MMM YYYY"


sheet.write(0, 1, datetime.now(), date_format)

book.save("output/examples/demo-python.xls")
