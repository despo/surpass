require "lib/surpass"

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end



w = Workbook.new
s = w.add_sheet('0')

colcount = 50 + 1
rowcount = 50 + 1

t0 = Time.now
puts "starting at #{t0.to_s}"

colcount.times do |c|
  rowcount.times do |r|
    s.write(r, c, String.random_alphanumeric(50))
  end
end


t1 = Time.now - t0
puts "elapsed #{t1.to_s}"

w.save("big-random-strings.xls")

t2 = Time.now - t0
puts "elapsed #{t2.to_s}"

