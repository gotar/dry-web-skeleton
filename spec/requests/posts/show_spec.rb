require 'web_helper'

RSpec.describe "GET /posts/:id ", type: :request do
  include_context 'posts'

  context "not existing record" do
    before { do_request(1) }

    it "returns 404 HTTP code" do
      expect(last_response.status).to eql(404)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end
  end

  context "existing record" do
    let!(:post) { create_post }
    before { do_request(post[:id]) }

    it "returns 200 HTTP code" do
      expect(last_response).to be_ok
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns single document as a JSON response' do
      expect(json_response_body).to eql({
        "id" => post.id,
        "title" => post.title,
        "body" => post.body
      })
    end
  end

  def do_request(id)
    get "/posts/#{id}"
  end
end
