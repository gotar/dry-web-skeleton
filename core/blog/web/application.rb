require 'dry/web/application'

module Blog
  InvalidParams = Class.new(StandardError)

  class Application < Dry::Web::Application
    plugin :json
    plugin :error_handler

    configure do |config|
      config.routes = 'apps/web/routes'.freeze
      config.container = Blog::Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    route do |r|
      r.multi_route
    end

    load_routes!

    error do |e|
      @_response.status = 422 if e.class == Blog::InvalidParams
      @_response.headers['Content-Type'] = 'application/json'
      @_response.write e.message
    end
  end
end
