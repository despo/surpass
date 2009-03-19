namespace :excel do
  desc "list all available colours"
  task :colors do
    puts Formatting::COLOURS.keys.sort
  end
end
