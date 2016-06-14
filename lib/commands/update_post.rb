require 'blog/import'

module Commands
  class UpdatePost
    include Blog::Import['validations.post_validator', 'persistence.repo.posts']

    def call(id, params)
      result = post_validator.call(params)

      if result.success?
        posts.update(id, result.output)
      else
        raise Blog::InvalidParams.new(result.messages.to_json)
      end
    end
  end
end
