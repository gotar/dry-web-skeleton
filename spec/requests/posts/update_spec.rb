require 'web_helper'

RSpec.describe "PUT /posts/:id ", type: :request do
  include_context 'posts'
  let!(:post) { create_post }

  context "invalid params" do
    before { do_request(post[:id], title: "") }

    it "returns 422 HTTP code" do
      expect(last_response.status).to eql(422)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns error message' do
      expect(json_response_body).to eql("title" => ["must be filled"])
    end
  end

  context "valid params" do
    before { do_request(post[:id]) }

    it "returns 200 HTTP code" do
      expect(last_response.status).to eql(200)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns updated record as a JSON' do
      r = json_response_body

      expect(r['id']).to eql(post[:id])
      expect(r['title']).to eql(base_params[:title])
      expect(r['body']).to eql(base_params[:body])
    end
  end

  private
  def do_request(id, params={})
    put "/posts/#{:id}", base_params.merge(params), {}
  end

  def base_params
    {
      title: 'Updated title',
      body: 'Updated body'
    }
  end
end
