# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

ensure_in_path 'lib'
require 'surpass'

Bones {
  name     'surpass'
  authors  'Ana Nelson'
  email    'ana@ananelson.com'
  url      'http://surpass.rubyforge.org'
  version  Surpass::VERSION
}

task :default => 'spec:run'
task 'gem:release' => 'test:run'

desc "run antlr compiler"
task :antlr do
  `cd lib/surpass; antlr4ruby ExcelFormulaGrammar.g`
end
