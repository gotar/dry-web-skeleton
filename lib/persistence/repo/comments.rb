require_relative "base"

module Persistence
  module Repo
    class Comments < Base[:comments]
      commands :create

      def count
        comments.count
      end
    end
  end
end
