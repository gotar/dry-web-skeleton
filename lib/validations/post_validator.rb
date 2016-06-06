require "dry-validation"

module Validations
  class PostValidator
    PostSchema = Dry::Validation.Form do
      required(:title) { filled? & str? }
      required(:body){ filled? & str? }
    end

    def call(args)
      PostSchema.call(args)
    end
  end
end
