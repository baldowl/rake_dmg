require 'rake/clean'
require 'rspec/core/rake_task'
require 'rake/rdoctask'
require 'jeweler'

RSpec::Core::RakeTask.new

task :spec => :check_dependencies
task :default => :spec

version = File.exists?('VERSION') ? File.read('VERSION').strip : ''

Rake::RDocTask.new :doc do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "Rake::Dmg #{version}"
  rdoc.rdoc_files.include('README.rdoc', 'LICENSE.rdoc', 'TODO.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Jeweler::Tasks.new do |gem|
  gem.name = 'rake_dmg'
  gem.summary = 'Rake library to build DMG files'
  gem.description = 'Rake library to build DMG files'
  gem.email = 'emanuele.vicentini@gmail.com'
  gem.homepage = 'http://github.com/baldowl/rake_dmg'
  gem.authors = ['Emanuele Vicentini']
  gem.rubyforge_project = 'rakedmg'
  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec', '>= 2.0.0'
  gem.rdoc_options << '--line-numbers' << '--inline-source' << '--title' <<
    "Rake::Dmg #{version}" << '--main' << 'README.rdoc'
  gem.test_files.clear
end

Jeweler::RubyforgeTasks.new
Jeweler::GemcutterTasks.new
