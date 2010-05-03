require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet

formula = ExcelFormula.new("1+1")
ws.write(0, 0, formula)

book.save(__FILE__.gsub(/rb$/, "xls"))
