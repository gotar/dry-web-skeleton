require 'web_helper'

RSpec.describe '/', type: :request do
  it 'redirect root page' do
    get '/'

    expect(last_response).to be_redirect
  end
end
