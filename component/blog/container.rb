require 'dry/web/container'

module Blog
  class Container < Dry::Web::Container
    setting :auto_register, 'lib'
    setting :core_dir, 'component'.freeze

    configure do |config|
      config.root = Pathname(__FILE__).dirname.join('../..')
      config.auto_register = 'lib'
    end

    load_paths! 'lib'
  end
end
