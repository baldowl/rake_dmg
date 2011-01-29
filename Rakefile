require 'rake/clean'
require 'rspec/core/rake_task'
require 'rake/rdoctask'
require 'jeweler'

RSpec::Core::RakeTask.new :spec
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
  gem.license = 'MIT'
  gem.author = 'Emanuele Vicentini'
  gem.email = 'emanuele.vicentini@gmail.com'
  gem.homepage = 'http://github.com/baldowl/rake_dmg'
  gem.rubyforge_project = 'rakedmg'
  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec', '>= 2.0.0'
  gem.rdoc_options << '--line-numbers' << '--inline-source' << '--title' <<
    "Rake::Dmg #{version}" << '--main' << 'README.rdoc'
end

Jeweler::GemcutterTasks.new
