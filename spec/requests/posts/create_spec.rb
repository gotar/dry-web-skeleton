require 'web_helper'

RSpec.describe "POST /posts ", type: :request do
  context "invalid params" do
    before { do_request(title: "") }

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
    before { do_request }

    it "returns 201 HTTP code" do
      expect(last_response.status).to eql(201)
    end

    it 'returns JSON ContentType' do
      expect(last_response.headers['Content-Type']).to match("application/json")
    end

    it 'returns created record as a JSON' do
      r = json_response_body

      expect(r['id']).to_not be_nil
      expect(r['title']).to eql(base_params[:title])
      expect(r['body']).to eql(base_params[:body])
    end
  end

  private
  def do_request(params={})
    post '/posts', base_params.merge(params), {}
  end

  def base_params
    {
      title: 'Foo',
      body: 'Bar'
    }
  end
end
