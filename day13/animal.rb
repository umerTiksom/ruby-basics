class Aminal
  def initialize(legs)
    @legs = legs
  end

  def eat(obj)
    puts "this animal is eating #{obj}"
  end

  def have_legs
    puts "this aminal have #{@legs} legs"
  end
end

class Dog < Aminal
  def initialize(legs)
    super(legs)
  end
end
d1 = Dog.new(4)
d1.eat('bone')
d1.have_legs
