RSpec.shared_context 'comments' do
  def create_comment(id, params={})
    Blog::Container["commands.create_comment"].(id,
      base_params.merge(params)
    )
  end

  def count_comments
    Blog::Container["persistence.repo.comments"].count
  end

  def base_params
    {
      body: "test comment"
    }
  end
end
