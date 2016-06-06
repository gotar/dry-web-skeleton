require_relative "base"

module Persistence
  module Repo
    class Posts < Base
      relations :posts
      commands :create

      def index
        posts.to_a
      end
    end
  end
end
