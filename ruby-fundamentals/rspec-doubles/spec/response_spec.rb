require 'spec_helper'
require 'response'

describe Response do

  subject(:response){ Response.new("Hello World") }

  it 'is successful' do
    expect(response).to be_success
    expect(response.status).to eq 200
    expect(response.to_s).to include "200 OK"
    expect(response.to_s).to include "Body: Hello World"
  end

  it 'can fail' do
    message = "Token not valid"
    response.error(403, message)
    expect(response).not_to be_success
    expect(response.status).to eq 403
    expect(response.to_s).to include "403 Forbidden"
    expect(response.to_s).to include "Body: #{message}"
  end
end
