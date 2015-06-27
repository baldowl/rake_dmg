require 'rubygems'
require 'rspec'

require 'rake/dmg'

RSpec::Matchers.define :be_defined do
  match do |task_name|
    Rake::Task.task_defined?(task_name)
  end
end

RSpec::Matchers.define :have_prerequisites do |*prereq_tasks|
  match do |task_name|
    list = Rake::Task[task_name].prerequisites
    prereq_tasks.all? {|t| list.include? t}
  end

  match_when_negated do |task_name|
    list = Rake::Task[task_name].prerequisites
    prereq_tasks.none? {|t| list.include? t}
  end

  failure_message do |task_name|
    "expected prerequisite tasks: #{prereq_tasks.join(', ')}; got #{Rake::Task[task_name].prerequisites.join(', ')}"
  end
end

RSpec.configure do |conf|
  conf.expect_with :rspec do |c|
    c.syntax = :should
  end
end
