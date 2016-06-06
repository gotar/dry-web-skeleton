require 'web_helper'

RSpec.describe "GET /posts ", type: :request do
  before { do_request }

  it "returns 200 HTTP code" do
    expect(last_response).to be_ok
  end

  it 'returns JSON ContentType' do
    expect(last_response.headers['Content-Type']).to match("application/json")
  end

  it 'returns empty array as a JSON response' do
    expect(last_response.body).to eql("[]")
  end

  def do_request
    get '/posts'
  end
end
