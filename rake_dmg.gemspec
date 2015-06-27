# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/dmg/version'

Gem::Specification.new do |spec|
  spec.name             = 'rake_dmg'
  spec.version          = Rake::DmgTask::VERSION
  spec.authors          = ['Emanuele Vicentini']
  spec.email            = ['emanuele.vicentini@gmail.com']
  spec.description      = 'Rake library to build DMG files'
  spec.summary          = 'Rake library to build DMG files'
  spec.homepage         = 'https://github.com/baldowl/rake_dmg'
  spec.license          = 'MIT'

  spec.files            = `git ls-files -z`.split("\x0")
  spec.test_files       = spec.files.grep(%r{^spec/})
  spec.require_paths    = ['lib']

  spec.rdoc_options     = [
    '--line-numbers',
    '--inline-source',
    '--title',
    "Rake::Dmg #{Rake::DmgTask::VERSION}",
    '--main',
    'README.rdoc'
  ]
  spec.extra_rdoc_files = [
    'LICENSE.rdoc',
    'README.rdoc'
  ]

  spec.add_runtime_dependency 'rake', '>= 0.9.0.beta.1'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rdoc', '>= 2.4.2'
end
