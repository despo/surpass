require "rubygems"
require "surpass"

# TODO this is broken in both Ruby and Python

book = Workbook.new
ws1 = book.add_sheet
ws2 = book.add_sheet
ws3 = book.add_sheet
ws4 = book.add_sheet
ws5 = book.add_sheet
ws6 = book.add_sheet

0.upto(0x100) do |i|
  ws1.write(i/0x10, i%0x10, i)
  ws2.write(i/0x10, i%0x10, i)
  ws3.write(i/0x10, i%0x10, i)
  ws4.write(i/0x10, i%0x10, i)
  ws5.write(i/0x10, i%0x10, i)
  ws6.write(i/0x10, i%0x10, i)
end

ws1.panes_frozen = true
ws1.horz_split_pos = 2

ws2.panes_frozen = true
ws2.vert_split_pos = 2

ws3.panes_frozen = true
ws3.horz_split_pos = 1
ws3.vert_split_pos = 1

ws4.panes_frozen = false
ws4.horz_split_pos = 12
ws4.horz_split_first_visible = 2

ws5.panes_frozen = false
ws5.vert_split_pos = 40
ws4.vert_split_first_visible = 2

ws6.panes_frozen = false
ws6.horz_split_pos = 12
ws4.horz_split_first_visible = 2
ws6.vert_split_pos = 40
ws4.vert_split_first_visible = 2

book.save(__FILE__.gsub(/rb$/, "xls"))

