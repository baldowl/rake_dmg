require 'rubygems'
require 'echoe'
require 'lib/rake/dmg'

Echoe.new('rake_dmg', Rake::DmgTask::VERSION) do |s|
  s.author = 'Emanuele Vicentini'
  s.email = 'emanuele.vicentini@gmail.com'
  s.summary = 'Rake library to build DMG files'
  s.runtime_dependencies = ['rake']
  s.development_dependencies += ['rake >=0.8.2', 'rspec']
  s.need_tar_gz = false
  s.project = 'rakedmg'
  s.gemspec_format = :yaml
  s.retain_gemspec = true
  s.rdoc_pattern = /^README|^LICENSE|^TODO/
  s.url = 'http://github.com/baldowl/rake_dmg'
end

require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(-o spec/spec.opts)
end

Rake::Task[:default].clear
Rake::Task.tasks.each {|t| t.clear if t.name =~ /test/}
task :default => :spec
