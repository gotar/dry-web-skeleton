require 'web_helper'

RSpec.describe "DELETE /posts/:id ", type: :request do
  include_context 'posts'
  let!(:post) { create_post }

  it "returns 200 HTTP code" do
    do_request(post[:id])

    expect(last_response.status).to eql(200)
  end

  it 'returns JSON ContentType' do
    do_request(post[:id])

    expect(last_response.headers['Content-Type']).to match("application/json")
  end

  it 'returns deleted record as a JSON' do
    do_request(post[:id])

    r = json_response_body

    expect(r['id']).to eql(post[:id])
    expect(r['title']).to eql(post[:title])
    expect(r['body']).to eql(post[:body])
  end

  it 'deletes only given record' do
    post2 = create_post

    expect {
      do_request(post2[:id])
    }.to change{ count_posts }.by(-1)

    expect( count_posts ).to eql(1)
  end

  private
  def do_request(id)
    delete "/posts/#{id}", {}, {}
  end
end
