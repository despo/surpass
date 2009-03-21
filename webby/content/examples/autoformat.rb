require 'rubygems'
require 'surpass'

book = Workbook.new(__FILE__.gsub(/rb$/, "xls"))
sheet = book.add_sheet

# Passing true for the style parameter to write will invoke autoformatting.
sheet.write(0, 0, "Hello World!", true)
sheet.write(1, 0, 1, true)
sheet.write(2, 0, 1.0, true)
sheet.write(3, 0, Date.today, true)
sheet.write(4, 0, DateTime.now, true)
sheet.write(5, 0, Time.now, true)

array_of_arrays = [
  [1, 2, 3],
  [1.0, 2.0, 3.0],
  [Date.today, DateTime.now],
  %w{a b c}
]

# Writing arrays will automatically autoformat.
sheet.write(7, 0, "With autoformat:")
sheet.write_arrays(8, 0, array_of_arrays)

# Unless you specify your own format, or nil for a generic default.
sheet.write(13, 0, "Without autoformat:")
sheet.write_arrays(14, 0, array_of_arrays, nil)

sheet.set_column_widths(0..2, 20)

book.save
