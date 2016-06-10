module Persistence
  module Relations
    class Comments < ROM::Relation[:sql]
      schema(:comments) do
        attribute :id, Types::Serial
        attribute :post_id, Types::Serial
        attribute :body, Types::String
      end
    end
  end
end
