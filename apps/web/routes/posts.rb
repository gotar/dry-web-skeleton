class Blog::Application < Dry::Web::Application
  route "posts" do |r|
    r.is do
      r.get do
        Blog::Container['commands.fetch_posts'].call.map(&:to_h)
      end

      r.post do
        r.response.status = 201
        Blog::Container['commands.create_post'].call(r.params).to_h
      end
    end

    r.is :id do |id|
      r.get do
        Blog::Container['commands.fetch_post'].call(id).to_h
      end
    end
  end
end
