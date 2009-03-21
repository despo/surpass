# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{surpass}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ana Nelson"]
  s.date = %q{2009-03-21}
  s.description = %q{Surpass is writing (and eventually reading) excel workbooks in pure Ruby. Surpass is based on xlwt (and pyExcelerator).}
  s.email = %q{ana@ananelson.com}
  s.extra_rdoc_files = ["History.txt", "README.txt", "spec/data/random-strings.txt", "stats/cloc.txt", "stats/rcov.txt", "stats/specdoc.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "examples/big-16mb.rb", "examples/big-random-strings.rb", "examples/blanks.rb", "examples/col_width.rb", "examples/dates.rb", "examples/format.rb", "examples/hello-world.rb", "examples/image.rb", "examples/merged.rb", "examples/merged0.rb", "examples/merged1.rb", "examples/num_formats.rb", "examples/numbers.rb", "examples/outline.rb", "examples/panes.rb", "examples/protection.rb", "examples/python.bmp", "examples/row_styles.rb", "examples/row_styles_empty.rb", "examples/set_cell_and_range_style.rb", "examples/wrapped-text.rb", "examples/write_arrays.rb", "examples/ws_props.rb", "lib/biff_record.rb", "lib/bitmap.rb", "lib/cell.rb", "lib/chart.rb", "lib/column.rb", "lib/document.rb", "lib/excel_formula.rb", "lib/excel_magic.rb", "lib/formatting.rb", "lib/row.rb", "lib/style.rb", "lib/surpass.rb", "lib/utilities.rb", "lib/workbook.rb", "lib/worksheet.rb", "spec/biff_record_spec.rb", "spec/cell_spec.rb", "spec/data/random-strings.txt", "spec/document_spec.rb", "spec/excel_formula_spec.rb", "spec/formatting_spec.rb", "spec/reference/P-0508-0000507647-3280-5298.xls", "spec/reference/all-cell-styles.bin", "spec/reference/all-number-formats.bin", "spec/reference/all-styles.bin", "spec/reference/mini.xls", "spec/row_spec.rb", "spec/spec_helper.rb", "spec/style_spec.rb", "spec/utilities_spec.rb", "spec/workbook_spec.rb", "spec/worksheet_spec.rb", "stats/cloc.txt", "stats/rcov.txt", "stats/specdoc.txt", "surpass-manual-0-0-3.pdf", "surpass.gemspec", "tasks/excel.rake", "tasks/metrics.rake"]
  s.has_rdoc = true
  s.homepage = %q{https://surpass.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
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
