ROM::SQL.migration do
  change do
    create_table(:comments) do
      primary_key :id
      foreign_key :post_id, :posts
      column :body, String, null: false
    end
  end
end
