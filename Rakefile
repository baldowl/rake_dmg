require 'rubygems'
require 'bundler/setup'

require 'rake/clean'
require 'rspec/core/rake_task'
require 'rake/dmg/version'
require 'rdoc/task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new :spec
task :default => :spec

RDoc::Task.new :doc do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "Rake::Dmg #{Rake::DmgTask::VERSION}"
  rdoc.main = 'README.rdoc'
  rdoc.rdoc_files.include('README.rdoc', 'LICENSE.rdoc', 'TODO.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
