require 'blog/import'

module Commands
  class FetchPost
    include Blog::Import["persistence.repo.posts"]

    def call(id)
      posts[id]
    end
  end
end
