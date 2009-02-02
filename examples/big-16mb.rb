require "lib/surpass"

w = Workbook.new
s = w.add_sheet('0')

# colcount = 200 + 1
# rowcount = 6000 + 1

colcount = 200 + 1
rowcount = 6000 + 1

t0 = Time.now
puts "starting at #{t0.to_s}"

colcount.times do |c|
  rowcount.times do |r|
    s.write(r, c, "BIG")
  end
end


t1 = Time.now - t0
puts "elapsed #{t1.to_s}"

w.save("big-16Mb.xls")

t2 = Time.now - t0
puts "elapsed #{t2.to_s}"
