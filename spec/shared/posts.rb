RSpec.shared_context 'posts' do
  def create_post(params={})
    Blog::Container["commands.create_post"].(
      base_post_params.merge(params)
    )
  end

  def fetch_post(id)
    Blog::Container["persistence.repo.posts"].show(id)
  end

  def fetch_posts
    Blog::Container["persistence.repo.posts"].index
  end

  def count_posts
    Blog::Container["persistence.repo.posts"].count
  end

  private

  def base_post_params
    {
      title: 'foo',
      body: 'bar'
    }
  end
end
