RSpec.shared_context 'comments' do
  def count_comments
    Blog::Container["persistence.repo.comments"].count
  end
end
