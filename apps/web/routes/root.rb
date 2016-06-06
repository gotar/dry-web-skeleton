class Blog::Application < Dry::Web::Application
  plugin :heartbeat, path: '/status'

  route '' do |r|
    r.is do
      r.get do
        r.redirect "/status"
      end
    end
  end
end
