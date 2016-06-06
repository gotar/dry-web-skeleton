require "blog/import"

module Commands
  class FetchPosts
    include Blog::Import("persistence.repo.posts")

    def call
      posts.index
    end
  end
end
