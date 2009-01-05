--- !ruby/object:Gem::Specification 
name: rake_dmg
version: !ruby/object:Gem::Version 
  version: 0.0.2
platform: ruby
authors: 
- Emanuele Vicentini
autorequire: 
bindir: bin

date: 2009-01-05 00:00:00 +01:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: rake
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: echoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: rake
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 0.8.2
    version: 
- !ruby/object:Gem::Dependency 
  name: rspec
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: Rake library to build DMG files
email: emanuele.vicentini@gmail.com
executables: []

extensions: []

extra_rdoc_files: 
- LICENSE.rdoc
- README.rdoc
files: 
- lib/rake/dmg.rb
- LICENSE.rdoc
- Manifest
- rake_dmg.gemspec
- Rakefile
- README.rdoc
- spec/dmg_spec.rb
- spec/spec.opts
- spec/spec_helper.rb
has_rdoc: true
homepage: http://github.com/baldowl/rake_dmg
post_install_message: 
rdoc_options: 
- --line-numbers
- --inline-source
- --title
- Rake_dmg
- --main
- README.rdoc
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "1.2"
  version: 
requirements: []

rubyforge_project: rakedmg
rubygems_version: 1.3.1
specification_version: 2
summary: Rake library to build DMG files
test_files: []
