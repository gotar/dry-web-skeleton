require 'blog/import'

module Commands
  class CreatePost
    include Blog::Import['validations.post_validator', 'persistence.repo.posts']

    def call(params)
      result = post_validator.call(params)

      if result.success?
        posts.create(result.output)
      else
        raise Blog::InvalidParams.new(result.messages.to_json)
      end
    end
  end
end
