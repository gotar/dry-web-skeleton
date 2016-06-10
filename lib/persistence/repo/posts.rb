require_relative "base"

module Persistence
  module Repo
    class Posts < Base[:posts]
      commands :create, update: :by_id, delete: :by_id

      def show(id)
        posts.by_id(id).one!
      end
      alias :[] :show

      def index
        posts.to_a
      end

      def count
        posts.count
      end
    end
  end
end
