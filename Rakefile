# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'surpass'

task :default => 'spec:run'

PROJ.name = 'surpass'
PROJ.authors = 'Ana Nelson'
PROJ.email = 'ana@ananelson.com'
PROJ.url = 'http://surpass.rubyforge.org'
PROJ.version = Surpass::VERSION
PROJ.rubyforge.name = 'surpass'

PROJ.spec.opts << '--color'

# EOF
