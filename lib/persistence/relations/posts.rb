module Persistence
  module Relations
    class Posts < ROM::Relation[:sql]
      schema(:posts) do
        attribute :id, Types::Serial
        attribute :title, Types::String
        attribute :body, Types::String

        associate do
          many :comments
        end
      end

      def by_id(id)
        where(posts__id: id)
      end
    end
  end
end
