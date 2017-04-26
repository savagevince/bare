require 'json'

class Request

  attr_reader :data
  private :data

  def initialize(data)
    @data = JSON.parse(data)
  end

  def auth_token
    data["auth_token"]
  end

  def user_name
    data["user_name"]
  end
end
