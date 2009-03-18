from xlwt import *
from datetime import datetime

book = Workbook()
sheet = book.add_sheet("Demo Worksheet")

# Let's set up some formatting.

# Remember to use Excel-style formatting directives, not sprintf.

date_format = XFStyle()
date_format.num_format_str = "DDDD DD MMM YYYY"

# fancy_format = StyleFormat.new(
#   :font_name => 'Times New Roman', 
#   :font_colour => 'green'
# )
# 
# sheet.write(0, 0, "Hello World!", fancy_format)
sheet.write(0, 1, datetime.now(), date_format)

book.save("output/examples/demo-python.xls")
