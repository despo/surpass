require "rubygems"
require "surpass"

book = Workbook.new
s = book.add_sheet('0')

colcount = 200 + 1
rowcount = 6000 + 1

start = Time.now
puts "starting at #{start.to_s}"

colcount.times do |c|
  rowcount.times do |r|
    s.write(r, c, "BIG")
  end
end

t = Time.now - start
puts "time elapsed (writing data to workbook) #{t.to_s}"

book.save(__FILE__.gsub(/rb$/, "xls"))

t = Time.now - start
puts "time elapsed (writing workbook to file) #{t.to_s}"
