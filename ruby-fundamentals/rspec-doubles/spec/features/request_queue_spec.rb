require 'request'
require 'queue'
require 'authorization'

describe 'it passes requests to a queue' do
  let(:user){ Authorization::USERS.first }
  it 'accepts a request' do
    request = Request.new({user_name: user[:user_name], auth_token: user[:auth_token]}.to_json)
    queue = Queue.new
    queue.append(request)
    expect(Authorization).to receive(:new).with(request)
    expect(queue.next).to eq request
  end
end
