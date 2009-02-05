require "rubygems"
require "surpass"

fnt = Font.new
fnt.name = 'Arial'
fnt.colour_index = 4
fnt.bold = true

borders = Borders.new
borders.left = 6
borders.right = 6
borders.top = 6
borders.bottom = 6

style = StyleFormat.new
style.font = fnt
style.borders = borders

book = Workbook.new

ws0 = book.add_sheet('Rows Outline')

ws0.write_merge(1, 1, 1, 5, 'test 1', style)
ws0.write_merge(2, 2, 1, 4, 'test 1', style)
ws0.write_merge(3, 3, 1, 3, 'test 2', style)
ws0.write_merge(4, 4, 1, 4, 'test 1', style)
ws0.write_merge(5, 5, 1, 4, 'test 3', style)
ws0.write_merge(6, 6, 1, 5, 'test 1', style)
ws0.write_merge(7, 7, 1, 5, 'test 4', style)
ws0.write_merge(8, 8, 1, 4, 'test 1', style)
ws0.write_merge(9, 9, 1, 3, 'test 5', style)

ws0.fetch_or_create_row(1).level = 1
ws0.fetch_or_create_row(2).level = 1
ws0.fetch_or_create_row(3).level = 2
ws0.fetch_or_create_row(4).level = 2
ws0.fetch_or_create_row(5).level = 2
ws0.fetch_or_create_row(6).level = 2
ws0.fetch_or_create_row(7).level = 2
ws0.fetch_or_create_row(8).level = 1
ws0.fetch_or_create_row(9).level = 1


ws1 = book.add_sheet('Columns Outline')

ws1.write_merge(1, 1, 1, 5, 'test 1', style)
ws1.write_merge(2, 2, 1, 4, 'test 1', style)
ws1.write_merge(3, 3, 1, 3, 'test 2', style)
ws1.write_merge(4, 4, 1, 4, 'test 1', style)
ws1.write_merge(5, 5, 1, 4, 'test 3', style)
ws1.write_merge(6, 6, 1, 5, 'test 1', style)
ws1.write_merge(7, 7, 1, 5, 'test 4', style)
ws1.write_merge(8, 8, 1, 4, 'test 1', style)
ws1.write_merge(9, 9, 1, 3, 'test 5', style)

ws1.fetch_or_create_column(1).level = 1
ws1.fetch_or_create_column(2).level = 1
ws1.fetch_or_create_column(3).level = 2
ws1.fetch_or_create_column(4).level = 2
ws1.fetch_or_create_column(5).level = 2
ws1.fetch_or_create_column(6).level = 2
ws1.fetch_or_create_column(7).level = 2
ws1.fetch_or_create_column(8).level = 1
ws1.fetch_or_create_column(9).level = 1


ws2 = book.add_sheet('Rows and Columns Outline')

ws2.write_merge(1, 1, 1, 5, 'test 1', style)
ws2.write_merge(2, 2, 1, 4, 'test 1', style)
ws2.write_merge(3, 3, 1, 3, 'test 2', style)
ws2.write_merge(4, 4, 1, 4, 'test 1', style)
ws2.write_merge(5, 5, 1, 4, 'test 3', style)
ws2.write_merge(6, 6, 1, 5, 'test 1', style)
ws2.write_merge(7, 7, 1, 5, 'test 4', style)
ws2.write_merge(8, 8, 1, 4, 'test 1', style)
ws2.write_merge(9, 9, 1, 3, 'test 5', style)

ws2.fetch_or_create_row(1).level = 1
ws2.fetch_or_create_row(2).level = 1
ws2.fetch_or_create_row(3).level = 2
ws2.fetch_or_create_row(4).level = 2
ws2.fetch_or_create_row(5).level = 2
ws2.fetch_or_create_row(6).level = 2
ws2.fetch_or_create_row(7).level = 2
ws2.fetch_or_create_row(8).level = 1
ws2.fetch_or_create_row(9).level = 1

ws2.write_merge(1, 1, 1, 5, 'test 1', style)
ws2.write_merge(2, 2, 1, 4, 'test 1', style)
ws2.write_merge(3, 3, 1, 3, 'test 2', style)
ws2.write_merge(4, 4, 1, 4, 'test 1', style)
ws2.write_merge(5, 5, 1, 4, 'test 3', style)
ws2.write_merge(6, 6, 1, 5, 'test 1', style)
ws2.write_merge(7, 7, 1, 5, 'test 4', style)
ws2.write_merge(8, 8, 1, 4, 'test 1', style)
ws2.write_merge(9, 9, 1, 3, 'test 5', style)

ws2.fetch_or_create_column(1).level = 1
ws2.fetch_or_create_column(2).level = 1
ws2.fetch_or_create_column(3).level = 2
ws2.fetch_or_create_column(4).level = 2
ws2.fetch_or_create_column(5).level = 2
ws2.fetch_or_create_column(6).level = 2
ws2.fetch_or_create_column(7).level = 2
ws2.fetch_or_create_column(8).level = 1
ws2.fetch_or_create_column(9).level = 1


book.save(__FILE__.gsub(/rb$/, "xls"))
