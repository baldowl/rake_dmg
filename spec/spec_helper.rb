require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/rake/dmg'

module RakeTaskMatchers
  class BeDefined
    def matches?(task_name)
      @task_name = task_name
      Rake::Task.task_defined?(task_name)
    end
    def failure_message
      "expected #{@task_name.inspect} to be defined"
    end
    def negative_failure_message
      "expected #{@task_name.inspect} not to be define"
    end
  end

  def be_defined
    BeDefined.new
  end

  class HavePrerequisites
    def initialize(prereq_tasks)
      @prereq_tasks = prereq_tasks
    end
    def matches?(task_name)
      @task_name = task_name
      @prereq_tasks.each do |t|
        return false if !Rake::Task[@task_name].prerequisites.include?(t)
      end
    end
    def failure_message
      "expected #{@prereq_tasks.inspect} to be prerequistes of #{@task_name.inspect}"
    end
    def negative_failure_message
      "expected #{@prereq_tasks.inspect} not to be prerequisites of #{@task_name.inspect}"
    end
  end

  def have_prerequisites(*prereq_tasks)
    HavePrerequisites.new prereq_tasks
  end
end

Spec::Runner.configure do |conf|
  conf.include RakeTaskMatchers
end
