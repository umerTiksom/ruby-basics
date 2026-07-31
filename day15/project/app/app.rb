require 'colorize'

require_relative '../lib/inventory'
require_relative '../lib/product'

inventory = Inventory.new

inventory.add(Product.new('Keyboard', 5000))
inventory.add(Product.new('Mouse', 2000))

puts 'Inventory'.green

inventory.display
