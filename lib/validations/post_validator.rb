require "dry-validation"

module Validations
  class PostValidator
    PostSchema = Dry::Validation.Form do
      required(:title, :str).filled
      required(:body, :str).filled
    end

    def call(args)
      PostSchema.call(args)
    end
  end
end
