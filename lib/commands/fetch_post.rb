require "blog/import"

module Commands
  class FetchPost
    include Blog::Import("persistence.repo.posts")

    def call(id)
      posts.show(id)
    end
  end
end
