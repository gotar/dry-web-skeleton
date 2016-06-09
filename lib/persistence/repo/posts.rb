require_relative "base"

module Persistence
  module Repo
    class Posts < Base[:posts]
      commands :create

      def show(id)
        posts.by_id(id).one!
      end

      def index
        posts.to_a
      end
    end
  end
end
