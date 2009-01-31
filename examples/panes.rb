require "excel"

# TODO this is broken in both Ruby and Python

w = Workbook.new
ws1 = w.add_sheet('sheet 1')
ws2 = w.add_sheet('sheet 2')
ws3 = w.add_sheet('sheet 3')
ws4 = w.add_sheet('sheet 4')
ws5 = w.add_sheet('sheet 5')
ws6 = w.add_sheet('sheet 6')

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

w.save('panes.xls')

