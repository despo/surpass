require "rubygems"
require "surpass"

book = Workbook.new
ws = book.add_sheet

ws.write(0, 0, Formula.new("-(1+1)"))
ws.write(1, 0, Formula.new("-(1+1)/(-2-2)"))
ws.write(2, 0, Formula.new("-(134.8780789+1)"))
ws.write(3, 0, Formula.new("-(134.8780789e-10+1)"))
ws.write(4, 0, Formula.new("-1/(1+1)+9344"))

ws.write(0, 1, Formula.new("-(1+1)"))
ws.write(1, 1, Formula.new("-(1+1)/(-2-2)"))
ws.write(2, 1, Formula.new("-(134.8780789+1)"))
ws.write(3, 1, Formula.new("-(134.8780789e-10+1)"))
ws.write(4, 1, Formula.new("-1/(1+1)+9344"))

ws.write(0, 2, Formula.new("A1*B1"))
ws.write(1, 2, Formula.new("A2*B2"))
ws.write(2, 2, Formula.new("A3*B3"))
#ws.write(3, 2, Formula.new("A4*B4*sin(pi()/4)"))
#ws.write(4, 2, Formula.new("A5%*B5*pi()/1000"))

##############
## NOTE: parameters are separated by semicolon!!!
##############


ws.write(5, 2, Formula.new("C1+C2+C3+C4+C5/(C1+C2+C3+C4/(C1+C2+C3+C4/(C1+C2+C3+C4)+C5)+C5)-20.3e-2"))
ws.write(5, 3, Formula.new("C1^2"))
#ws.write(6, 2, Formula.new("SUM(C1;C2;;;;;C3;;;C4)"))
#ws.write(6, 3, Formula.new("SUM($A$1:$C$5)"))

ws.write(7, 0, Formula.new('"lkjljllkllkl"'))
ws.write(7, 1, Formula.new('"yuyiyiyiyi"'))
#ws.write(7, 2, Formula.new('A8 & B8 & A8'))
#ws.write(8, 2, Formula.new('now()'))

ws.write(10, 2, Formula.new('TRUE'))
ws.write(11, 2, Formula.new('FALSE'))
#ws.write(12, 3, Formula.new('IF(A1>A2;3;"hkjhjkhk")'))

book.save(__FILE__.gsub(/rb$/, "xls"))
