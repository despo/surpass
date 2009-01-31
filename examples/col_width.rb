require "lib/surpass"

w = Workbook.new
ws = w.add_sheet('Hey, Dude')

(6...80).each do |i|
    fnt = Font.new
    fnt.height = i*20
    style = StyleFormat.new
    style.font = fnt
    ws.write(1, i, 'Test')
    ws.col(i).width = 0x0d * i
end

w.save('col_width.xls')
