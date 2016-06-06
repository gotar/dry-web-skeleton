require 'db_helper'

require 'rack/test'

require_relative '../core/boot'

module AppHelper
  def app
    Blog::Application.app
  end

  def json_response_body
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    Blog::Application.freeze
  end

  config.include Rack::Test::Methods, type: :request
  config.include AppHelper, type: :request
end
