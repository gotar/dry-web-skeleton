require "dry-validation"

module Validations
  class CommentValidator
    CommentSchema = Dry::Validation.Form do
      required(:post_id, :int).filled
      required(:body, :str).filled
    end

    def call(args)
      CommentSchema.call(args)
    end
  end
end
