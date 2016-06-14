require 'dry/web/roda/application'
require_relative '../container'

module Blog
  InvalidParams = Class.new(StandardError)

  class Application < Dry::Web::Roda::Application
    plugin :all_verbs
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
      @_response.status = response_status(e)
      @_response.headers['Content-Type'] = 'application/json'
      @_response.write e.message
    end

    def response_status(e)
      case e
      when ROM::TupleCountMismatchError then 404
      when Blog::InvalidParams then 422
      else
        500
      end
    end
  end
end
