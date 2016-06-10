require 'web_helper'

RSpec.describe "POST /posts/:id/comments ", type: :request do
  include_context "posts"
  include_context "comments"

  let!(:post_record) { create_post }

  context "invalid params" do
    before { do_request(post_record[:id], body: "") }

    it "returns 422 HTTP code" do
      expect(last_response.status).to eql(422)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns error message' do
      expect(json_response_body).to eql("body" => ["must be filled"])
    end
  end

  context "valid params" do
    before { do_request(post_record[:id]) }

    it "returns 201 HTTP code" do
      expect(last_response.status).to eql(201)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns created record as a JSON' do
      r = json_response_body

      expect(r['id']).to_not be_nil
      expect(r['post_id']).to eql(post_record[:id])
      expect(r['body']).to eql(base_params[:body])
    end

    it 'increase number of records in db' do
      expect {
        do_request(post_record[:id])
      }.to change{ count_comments }.by(1)
    end
  end

  private
  def do_request(id, params={})
    post("/posts/#{id}/comments", base_params.merge(params), {})
  end

  def base_params
    {
      body: 'Test comment'
    }
  end
end

