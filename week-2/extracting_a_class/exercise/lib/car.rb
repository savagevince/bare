class Car
  # constants to store data that is not meant to change often
  PASSENGER_LIMIT_DEFAULT = 4
  TOP_SPEED_DEFAULT = 120

  # public reader methods exposed to other objects
  attr_reader :speed, :passengers, :engine_on

  # configuration for the instance
  # assigns defaults for the config
  # sets 5 instance variables, integers, boolean, array

  def initialize(config)
    @top_speed = config[:top_speed] || TOP_SPEED_DEFAULT
    @passenger_limit = config[:passenger_limit] || PASSENGER_LIMIT_DEFAULT
    @speed = 0
    @engine_on = false
    @passengers = []
  end

  # has a Person instance input
  # checks the value stored in that object's instance variable against an integer stored in this class instance
  # then sets the driver instance variable
  def driver=(person)
    fail 'Driver Age Error' unless person.age > 18

    @driver = person
  end

  # checks if there is a person instance stored in @driver
  # creates an interpolated string with the driver first name and last name
  # returns the string
  def driver_name
    fail 'No Driver Error' if driver.nil?

    "#{driver.first_name} #{driver.last_name}"
  end

  # checks if there is a person instance stored in @driver
  # sets the value of engine_on to true
  def turn_on_engine
    fail 'No Driver Error' if driver.nil?

    @engine_on = true
  end

  # checks if there is a person instance stored in @driver
  # sets the value of engine_on to false
  def turn_off_engine
    fail 'No Driver Error' if driver.nil?

    @engine_on = false
  end

  # checks if the value stored in @engine_on is true
  # loops through for a number if iterations, breaks if the speed is higher than top_speed
  # sets a new speed by incrementing
  def accelerate(increment, seconds)
    fail 'Engine Off Error' unless engine_on

    seconds.times do
      break if speed >= top_speed
      @speed += increment
    end
  end

  # checks if the value stored in @engine_on is true
  # loops through for a number if iterations, breaks if the speed is less than 1
  # sets a new speed by decrementing
  def brake(seconds)
    fail 'Engine Off Error' unless engine_on

    seconds.times do
      break if speed <= 1
      @speed -= 1
    end
  end

  # checks the passengers array for whether it is more than the limit
  # adds item to array
  def add(passenger)
    fail 'Limit Reached Error' if passengers.count >= passenger_limit

    @passengers << passenger
  end

  private

  # keeps these three reader methods private
  attr_reader :passenger_limit, :top_speed, :driver
end
