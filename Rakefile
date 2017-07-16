require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
  end

  task :default => [:spec, :features]

rescue LoadError
  $stderr.puts "Could not load Cucumber"
end

task :serve do |t|
  sh 'bundle exec jekyll serve'
end
