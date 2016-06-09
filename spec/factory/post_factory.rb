RSpec.shared_context 'posts' do
  def create_post(params={})
    Blog::Container["commands.create_post"].(
      base_post_params.merge(params)
    )
  end

  def base_post_params
    {
      title: 'foo',
      body: 'bar'
    }
  end
end
