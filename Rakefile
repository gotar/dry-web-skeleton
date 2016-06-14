require "bundler/setup"
require "rspec/core/rake_task"
require "rom/sql/rake_task"

require_relative './component/blog/container'

RSpec::Core::RakeTask.new :spec
task default: [:spec]

namespace :db do
  task :setup do
    Blog::Container.boot!(:rom)
  end
end
