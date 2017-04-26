require 'spec_helper'
require 'authorization'

describe Authorization do

  let(:response_class){ double :response_class, new: response}
  let(:response){ double :response }

  it 'rejects requests where token does not match username' do
    request = double :request, user_name: Authorization::USERS.first[:user_name], auth_token: 'bad token'
    authorization = Authorization.new(request, response_class)
    expect(response).to receive(:error).with(403, Authorization::DEFAULT_ERRORS[403])
    expect(authorization.response).to eq response
  end

  it 'rejects requests where username not found' do
    request = double :request, user_name: "malicious intent", auth_token: Authorization::USERS.first[:auth_token]
    authorization = Authorization.new(request, response_class)
    expect(response).to receive(:error).with(403, Authorization::DEFAULT_ERRORS[403])
    expect(authorization.response).to eq response
  end

  it 'authorizes a good request' do
    user = Authorization::USERS.first
    request = double :request, user_name: user[:user_name], auth_token: user[:auth_token]
    authorization = Authorization.new(request, response_class)
    expect(response_class).not_to receive(:error)
    expect(authorization.response).to eq response
  end
end
