require "dry-validation"

module Validations
  class CommentValidator
    CommentSchema = Dry::Validation.Form do
      required(:post_id).filled(:int?)
      required(:body).filled(:str?)
    end

    def call(args)
      CommentSchema.call(args)
    end
  end
end
