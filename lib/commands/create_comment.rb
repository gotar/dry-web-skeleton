require 'blog/import'

module Commands
  class CreateComment
    include Blog::Import['validations.comment_validator', 'persistence.repo.comments']

    def call(id, params)
      result = comment_validator.call(params.merge(post_id: id))

      if result.success?
        comments.create(result.output)
      else
        raise Blog::InvalidParams.new(result.messages.to_json)
      end
    end
  end
end
