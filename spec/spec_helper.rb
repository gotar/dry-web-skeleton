ENV["RACK_ENV"] = "test"

SPEC_ROOT = Pathname(__FILE__).dirname
Dir[SPEC_ROOT.join("support/*.rb").to_s].each(&method(:require))
Dir[SPEC_ROOT.join("shared/*.rb").to_s].each(&method(:require))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
end
