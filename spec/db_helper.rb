require_relative "spec_helper"
require_relative '../component/blog/container'

Blog::Container.boot!(:rom)

require "database_cleaner"
DatabaseCleaner[:sequel, connection: TestHelpers.db_connection].strategy = :truncation

RSpec.configure do |config|
  config.include TestHelpers

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

