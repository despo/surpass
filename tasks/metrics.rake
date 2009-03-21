require 'spec/rake/spectask'

task :metrics => "metrics:all"

namespace :metrics do
  desc "Run all custom stats"
  task :all => [:cloc, :clean_rcov]

  desc "Run CLOC metrics and store in stats/cloc.txt"
  task :cloc do
    puts `cloc --no3 --report-file=stats/cloc.txt lib/`
  end

  desc "Run RCOV metrics and store in stats/rcov.txt"
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = FileList['spec/**/lib/*.rb']
    t.spec_opts = ['--format', 'specdoc:stats/specdoc.txt']
    t.out = 'stats/rcov.txt'
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec', '--text-report']
  end

  desc "clean non-rcov text from an rcov file"
  task :clean_rcov => [:rcov] do |t|
    array = File.readlines("stats/rcov.txt")
    File.open("stats/rcov.txt", "w") do |f|
      state = :new
      array.each do |l|
        case state
        when :new
          next unless l =~ /^\+--/
          state = :rcov
          f.write l
        when :rcov
          f.write l
        else
          raise "bad state #{state}"
        end
      end
    end
  end
end
