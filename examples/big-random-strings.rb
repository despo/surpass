require "lib/surpass"

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end

strings = File.read("spec/data/random-strings.txt").split("\n")

w = Workbook.new
s = w.add_sheet('0')

colcount = 30 + 1
rowcount = 30 + 1

t0 = Time.now
puts "starting at #{t0.to_s}"

colcount.times do |c|
  rowcount.times do |r|
    i = c * rowcount + r
    s.write(r, c, strings[i])
  end
end


t1 = Time.now - t0
puts "elapsed #{t1.to_s}"

w.save("ruby-big-random-strings.xls")

File.open("ruby-ws", "w") do |f|
  f.write s.to_biff
end


File.open("ruby-sst", "w") do |f|
  f.write w.sst.to_biff
end

t2 = Time.now - t0
puts "elapsed #{t2.to_s}"

