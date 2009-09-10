desc "render output latex to a PDF"
task :pdf => [:build] do
  files = IO.popen("find output/").read
  files.chomp.each do |f|
    f = f.rstrip
    next unless f =~ /\.tex$/
    dir = File.dirname(f)
    file = File.basename(f)
    system("cd #{dir}; pdflatex #{file}")
    
    `mv output/surpass-manual.pdf output/#{manual_filename}`
    `cp output/#{manual_filename} ../..`
  end
end
