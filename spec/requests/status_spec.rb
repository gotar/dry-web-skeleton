require 'web_helper'

RSpec.describe '/status', type: :request do

  before { get '/status' }

  it 'returns 200 HTTP' do
    expect(last_response).to be_ok
  end

  it 'returns OK response message' do
    expect(last_response.body).to eql('OK')
  end
end
