desc "render output latex to a PDF"
task :pdf => [:build] do
  files = IO.popen("find output/").read
  files.chomp.each do |f|
    f = f.rstrip
    next unless f =~ /\.tex$/
    dir = File.dirname(f)
    file = File.basename(f)
    system("cd #{dir}; pdflatex #{file}")
  end
end
