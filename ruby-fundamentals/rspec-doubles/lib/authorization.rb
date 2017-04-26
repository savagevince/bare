class Authorization

  attr_reader :response_class, :request
  private :response_class, :request

  DEFAULT_ERRORS = { 403 => "Your token is not valid" }
  USERS = [
    {user_name: "stace", auth_token: "9087654321"},
    {user_name: "steve", auth_token: "1234567890"}
  ]

  def initialize(request, response_class = Response)
    @request = request
    @response_class = response_class
  end

  def response
    response = response_class.new.tap do |response|
      response.error(403, DEFAULT_ERRORS[403]) unless authorized?
    end
  end

  private

  def authorized?
    user = USERS.select{|user| user[:user_name] == request.user_name}.first
    user && user[:auth_token] == request.auth_token
  end
end
