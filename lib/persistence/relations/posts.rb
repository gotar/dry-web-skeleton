module Persistence
  module Relations
    class Posts < ROM::Relation[:sql]
      schema(:posts) do
        attribute :id, Types::Serial
        attribute :title, Types::String
        attribute :body, Types::String
      end

      def by_id(id)
        where(id: id)
      end
    end
  end
end
