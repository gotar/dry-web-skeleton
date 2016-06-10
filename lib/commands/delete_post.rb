require 'blog/import'

module Commands
  class DeletePost
    include Blog::Import('persistence.repo.posts')

    def call(id)
      posts.delete(id)
    end
  end
end
