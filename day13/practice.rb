# inheritance example
class Vehicle
  attr_accessor :wheel, :engine, :capacity

  def initialize(wheel, engine, capacity)
    @engine = engine
    @wheel = wheel
    @capacity = capacity
    puts 'vehicle constructor call'
  end
end

# bike is inerit with vehicle class
class Bike < Vehicle
  def initialize(wheel, engine, capacity)
    super(wheel, engine, capacity)
    puts 'Bike constructor call'
  end

  def bike_start
    puts 'Bike is started'
  end

  def bike_wheels
    puts "Bike have #{@wheel} wheels"
  end
end

bike1 = Bike.new(2, 70, 2)
bike1.bike_start
bike1.bike_wheels
module Shapes
  def draw_circle
    puts 'draw the circle'
  end

  def draw_triangle
    puts 'draw the triangle'
  end

  def draw_square
    puts 'draw the square'
  end
end

class Art
  include Shapes
end
u1 = Art.new
u1.draw_circle
u1.draw_square
