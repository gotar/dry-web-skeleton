require 'dry/web/container'

module Blog
  class Container < Dry::Web::Container
    configure do |config|
      config.auto_register = 'lib'
      config.core_dir = 'component'
      config.root = Pathname(__FILE__).dirname.join('../..')
    end

    load_paths! 'lib'
  end
end
