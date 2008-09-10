require 'rubygems'
require 'echoe'

Echoe.new('rake_dmg', '0.0.0') do |s|
  s.author = 'Emanuele Vicentini'
  s.email = 'emanuele.vicentini@gmail.com'
  s.summary = 'Rake library to build DMG files'
  s.runtime_dependencies = ['rake >=0.8.2']
  s.need_tar_gz = false
  s.project = nil
end

require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(-c)
end

Rake::Task[:default].clear
Rake::Task.tasks.each {|t| t.clear if t.name =~ /test/}
task :default => :spec
