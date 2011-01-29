require 'rake/clean'
require 'rspec/core/rake_task'
require 'lib/rake/dmg'
require 'rake/rdoctask'
require 'jeweler'

RSpec::Core::RakeTask.new

task :spec => :check_dependencies
task :default => :spec

Rake::RDocTask.new :doc do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "Rake::Dmg #{Rake::DmgTask::VERSION}"
  rdoc.rdoc_files.include('README.rdoc', 'LICENSE.rdoc', 'TODO.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Jeweler::Tasks.new do |gem|
  gem.name = 'rake_dmg'
  gem.version = Rake::DmgTask::VERSION
  gem.summary = 'Rake library to build DMG files'
  gem.description = 'Rake library to build DMG files'
  gem.email = 'emanuele.vicentini@gmail.com'
  gem.homepage = 'http://github.com/baldowl/rake_dmg'
  gem.authors = ['Emanuele Vicentini']
  gem.rubyforge_project = 'rakedmg'
  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec', '>= 2.0.0'
  gem.rdoc_options << '--line-numbers' << '--inline-source' << '--title' <<
    "Rake::Dmg #{Rake::DmgTask::VERSION}" << '--main' << 'README.rdoc'
  gem.test_files.clear
end

Jeweler::RubyforgeTasks.new
Jeweler::GemcutterTasks.new
