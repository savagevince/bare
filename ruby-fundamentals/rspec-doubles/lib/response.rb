class Response

  attr_reader :headers, :body
  private :headers, :body

  DEFAULT_HEADERS = {"Status" => "200 OK", "Server" => "WEBrick/1.3.1 (Ruby/2.3.1/#{DateTime.new})"}.freeze
  STATUS_CODES = {"200" => "OK", "403" => "Forbidden"}.freeze

  def initialize(body = nil)
    @headers = DEFAULT_HEADERS.dup
    @body = body
  end

  def success?
    status == 200
  end

  def error(status_code, message = nil)
    headers["Status"] = status_string(status_code)
    @body = message
  end

  def status
    headers["Status"].split(" ").first.to_i
  end

  def to_s
    "#{headers_string}, #{body_string}"
  end

  private

  def status_string(status_code)
    "#{status_code.to_s} #{STATUS_CODES[status_code.to_s]}"
  end

  def headers_string
    "Headers: #{headers.to_s}" if headers
  end

  def body_string
    "Body: #{body.to_s}" if body
  end
end
