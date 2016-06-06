require_relative "../../../lib/commands/fetch_posts"
require_relative "../../../lib/commands/create_post"

class Blog::Application < Dry::Web::Application
  route "posts" do |r|
    r.is do
      r.get do
        Blog::Container['commands.fetch_posts'].call
      end

      r.post do
        r.response.status = 201
        Blog::Container['commands.create_post'].call(r.params)
      end
    end
  end
end
