require "lib/surpass"

w = Workbook.new
ws = w.add_sheet('Hey, Dude')

formats = [
    'M/D/YY',
    'D-MMM-YY',
    'D-MMM',
    'MMM-YY',
    'h:mm AM/PM',
    'h:mm:ss AM/PM',
    'h:mm',
    'h:mm:ss',
    'M/D/YY h:mm',
    'mm:ss',
    '[h]:mm:ss',
    'mm:ss.0',
]

formats.each_with_index do |f, i|
  ws.write(i, 0, f)
  
  style = StyleFormat.new
  style.number_format_string = f
  
  ws.write(i, 4, Time.now, style)
end

w.save('dates.xls')
