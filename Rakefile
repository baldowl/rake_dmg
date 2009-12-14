require 'rake/clean'
require 'spec/rake/spectask'
require 'lib/rake/dmg'
require 'rake/rdoctask'
require 'jeweler'

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(-O spec/spec.opts)
end

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
  gem.add_development_dependency 'rspec'
  gem.rdoc_options << '--line-numbers' << '--inline-source' << '--title' <<
    "Rake::Dmg #{Rake::DmgTask::VERSION}" << '--main' << 'README.rdoc'
  gem.test_files.clear
end

Jeweler::RubyforgeTasks.new
Jeweler::GemcutterTasks.new
