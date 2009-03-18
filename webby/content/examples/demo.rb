require 'rubygems'
require 'surpass'

book = Workbook.new("output/examples/demo.xls") # You can pass a filename here too.
sheet = book.add_sheet("Demo Worksheet") # You can name your worksheets.

# Let's set up some formatting.

# Remember to use Excel-style formatting directives, not sprintf.
date_format = StyleFormat.new(:number_format_string => "DDDD DD MMM YYYY")

sheet.write(0, 1, Date.today, date_format)

book.save
