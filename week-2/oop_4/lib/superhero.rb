module UsesPower
  attr_reader :power

  def use_power
    "#{ @name } is now #{ power.description }"
  end
end

class Superhero
  include UsesPower

  attr_reader :name

  def initialize(name, power)
    @name = name
    @power = power
  end

  def use_power
    p "#{ super }!"
  end

  def >(other)
    power > other.power
  end
end

class Villain
  include UsesPower

  attr_reader :name

  def initialize(name, power)
    @name = name
    @power = power
  end

  def use_power
    p "#{ super }, villainously!"
  end
end

class Power
  attr_reader :description

  def initialize(description, rating)
    @description = description
    @rating = rating
  end

  def >(other)
    rating > other.rating
  end

  protected

  attr_reader :rating
end

class Fight
  def initialize(hero, villain)
    @hero = hero
    @villain = villain
  end

  def run
    p hero.use_power
    p villain.use_power
    p "#{winner.name} is victorious!"
  end

  private

  attr_reader :hero, :villain

  def winner
    hero > villain ? hero : villain
  end
end

speed = Power.new("running real fast", 3)
wealth_and_sadness = Power.new("wealthy and sad :*(", -10)

flash = Superhero.new("The Flash", speed)
# flash.use_power # => "The Flash is now running real fast!"

santa = Superhero.new("Santa Claus", speed)
# santa.use_power # => "Santa Claus is now running real fast!"

batman = Superhero.new("Batman", wealth_and_sadness)
# batman.use_power # => "Batman is now wealthy and sad :(!"

lex = Villain.new("Lex Luthor", wealth_and_sadness)
# lex.use_power # => "Lex is now wealthy and sad :(, villainously!"

# p flash > lex # => true

Fight.new(flash, lex).run # => "The Flash is now running real fast! Lex is now wealthy and sad :(, villainously! The Flash is victorious!"