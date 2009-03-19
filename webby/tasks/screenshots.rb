require "rubygems"
begin
  require "rbosa"
rescue
  "You don't have RubyOSA. That's okay but won't be able to automatically activate Excel for screenshots."
end

def capture_xls(xls, png)
  `open #{xls}`
  sleep 2
  `screencapture #{png}`
  `mogrify -crop 840x570+14+54 #{png}`
end

# Excel should be already open, and it should be assigned to a 
# Space with nothing else in it for nice, tidy screenshots.
# Desktop background should be set to plain white, or use Backdrop.app.
# Also you should have "When switching to an application, switch to a ..." box checked
begin
  app = OSA.app("Microsoft Excel")
  app.activate
rescue
  puts "OSA activation of Microsoft Excel didn't work, you'll have to activate it manually."
end

`mkdir -p output/examples`

# Take screenshots of all Ruby Examples.
`ls content/examples/*.rb`.chomp.split("\n").each_with_index do |f, i|
  puts "processing #{f}..."

  png = f.gsub(/rb$/, "png")
  xls = f.gsub(/rb$/, "xls")

  `ruby #{f}`
  capture_xls(xls, png)
end

# Take screenshots of all Python Examples.
`ls content/examples/*.py`.chomp.split("\n").each_with_index do |f, i|
  exit # Skip processing Python examples for the moment.
  
  puts "processing #{f}..."

  png = f.gsub(/\.py$/, "-python.png")
  xls = f.gsub(/\.py$/, "-python.xls")

  `python #{f}`
  capture_xls(xls, png)
end

# Return to iTerm
begin
  app = OSA.app("iTerm")
  app.activate
rescue
end

