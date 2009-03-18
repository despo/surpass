require "rubygems"
require "rbosa"

def capture_xls(xls, png)
  `open #{xls}`
  sleep 2
  `screencapture #{png}`
  `mogrify -crop 840x570+14+54 #{png}`
end

# Excel should be already open, and it should be assigned to a 
# Space with nothing else in it for nice, tidy screenshots.
# Desktop background should be set to plain white.
# Also you should have "When switching to an application, switch to a ..." box checked
# app = OSA.app("Microsoft Excel")
# app.activate

`mkdir -p output/examples`

# Take screenshots of all Ruby Examples.
`ls content/examples/*.rb`.chomp.split("\n").each_with_index do |f, i|
  puts "processing #{f}..."

  png = f.gsub('content/', 'output/').gsub(/rb$/, "png")
  xls = f.gsub('content/', 'output/').gsub(/rb$/, "xls")

  `ruby #{f}`
  capture_xls(xls, png)
end

# Take screenshots of all Python Examples.
`ls content/examples/*.py`.chomp.split("\n").each_with_index do |f, i|
  puts "processing #{f}..."

  png = f.gsub('content/', 'output/').gsub(/\.py$/, "-python.png")
  xls = f.gsub('content/', 'output/').gsub(/\.py$/, "-python.xls")

  `python #{f}`
  capture_xls(xls, png)
end

# Return to iTerm
# app = OSA.app("iTerm")
# app.activate
