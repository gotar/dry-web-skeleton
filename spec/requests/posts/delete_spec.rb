require 'web_helper'

RSpec.describe "DELETE /posts/:id ", type: :request do
  include_context 'posts'
  let!(:post) { create_post }

  before { do_request(post[:id]) }

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it 'returns JSON ContentType' do
    expect(last_response.headers['Content-Type']).to match("application/json")
  end

  it 'returns deleted record as a JSON' do
    r = json_response_body

    expect(r['id']).to eql(post[:id])
    expect(r['title']).to eql(post[:title])
    expect(r['body']).to eql(post[:body])
  end

  private
  def do_request(id)
    delete "/posts/#{:id}", {}, {}
  end
end
