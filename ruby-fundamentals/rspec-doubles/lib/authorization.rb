require 'response'

class Authorization

  attr_reader :request
  private :request

  DEFAULT_ERRORS = { 403 => "Your token is not valid" }
  USERS = [
    {user_name: "stace", auth_token: "9087654321"},
    {user_name: "steve", auth_token: "1234567890"}
  ]

  def initialize(request)
    @request = request
  end

  def response
  end

end
