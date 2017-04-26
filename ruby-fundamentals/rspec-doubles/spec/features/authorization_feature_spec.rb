require 'spec_helper'
require 'authorization'
require 'request'
require 'response'

describe 'authorising a request' do
  
  it 'rejects requests where token does not match username' do
    request = Request.new({user_name: Authorization::USERS.first[:user_name], auth_token: 'bad token'}.to_json)
    authorization = Authorization.new(request)
    expect(authorization.response.status).to eq(403)
    expect(authorization.response.to_s).to include Authorization::DEFAULT_ERRORS[403]
  end

  it 'rejects requests where username not found' do
    request = Request.new({user_name: "malicious intent", auth_token: Authorization::USERS.first[:auth_token]}.to_json)
    authorization = Authorization.new(request)
    expect(authorization.response.status).to eq(403)
    expect(authorization.response.to_s).to include Authorization::DEFAULT_ERRORS[403]
  end

  it 'authorizes a good request' do
    user = Authorization::USERS.first
    request = Request.new({user_name: user[:user_name], auth_token: user[:auth_token]}.to_json)
    authorization = Authorization.new(request)
    expect(authorization.response.status).to eq(200)
    expect(authorization.response.to_s).to include "200 OK"
  end
end
