# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{surpass}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ana Nelson"]
  s.date = %q{2009-03-21}
  s.default_executable = %q{surpass-info}
  s.description = %q{Surpass is writing (and eventually reading) excel workbooks in pure Ruby. Surpass is based on xlwt (and pyExcelerator).  For comprehensive documentation, please refer to the PDF manual which is available from http://surpass.rubyforge.org or in the root directory of the source code repository.  If you like to learn from playing with working examples, then there are plenty in the examples/ and webby/examples directories of the source code.}
  s.email = %q{ana@ananelson.com}
  s.executables = ["surpass-info"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "README.txt", "bin/surpass-info"]
  s.files = ["History.txt", "LICENSE.txt", "README.txt", "Rakefile", "bin/surpass-info", "lib/biff_record.rb", "lib/bitmap.rb", "lib/cell.rb", "lib/chart.rb", "lib/column.rb", "lib/document.rb", "lib/excel_formula.rb", "lib/excel_magic.rb", "lib/formatting.rb", "lib/row.rb", "lib/style.rb", "lib/surpass.rb", "lib/utilities.rb", "lib/workbook.rb", "lib/worksheet.rb"]
  s.has_rdoc = false
  s.homepage = %q{https://surpass.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{surpass}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Surpass is writing (and eventually reading) excel workbooks in pure Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.4.2"])
    else
      s.add_dependency(%q<bones>, [">= 2.4.2"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.4.2"])
  end
end
