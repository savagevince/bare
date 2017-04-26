require 'spec_helper'
require 'json'
require 'request'

describe Request do
  let(:auth_token){ "1234567890" }
  let(:user_name){ "bob" }
  let(:request_data){ { user_name: user_name, auth_token: auth_token }.to_json }
  subject(:request){ Request.new(request_data) }

  it 'returns auth token' do
    expect(request.auth_token).to eq auth_token
  end

  it 'returns the name' do
    expect(request.user_name).to eq user_name
  end
end
