require "lib/surpass"

w = Workbook.new
ws = w.add_sheet('Hey, Dude')

(6..80).each do |i|
  fnt = Font.new
  fnt.height = i*20
  style = StyleFormat.new
  style.font = fnt
  ws.write(i, 1, 'Test')
  ws.row(i).style = style
end

w.save('row_styles.xls')
