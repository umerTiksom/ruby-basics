require_relative 'product'
class Inventory
  def initialize
    @products = []
  end

  def add(product)
    @products << product
  end

  def display
    @products.each do |product|
      puts "#{product.name} - #{product.price}"
    end
  end
end
