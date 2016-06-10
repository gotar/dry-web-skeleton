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

    r.on :id do |id|
      r.is do
        r.get do
          Blog::Container['commands.fetch_post'].call(id).to_h
        end

        r.put do
          Blog::Container['commands.update_post'].call(id, r.params).to_h
        end

        r.delete do
          Blog::Container['commands.delete_post'].call(id).to_h
        end
      end

      r.is "comments" do
        r.post do
          r.response.status = 201
          Blog::Container['commands.create_comment'].call(id, r.params).to_h
        end
      end
    end
  end
end
