class Inventory
  def initialize
    @products = {}
  end

  # function use to add the product
  def add_product(id, name, price, quantity)
    @products[id] = { name: name,
                      price: price,
                      quantity: quantity }
    puts 'Product add successfully'
    print "\n"
  end

  # delete the product from the inventory
  def delete_product(id)
    if @products.delete(id)
      puts 'product delete successfully'
    else
      puts 'product not found'
    end
  end

  # search the product in the inventory
  def search_product(id)
    if @products.key?(id)
      print "\n"
      puts '-------- Product found successfully ---------'
      print "\n"
      puts "Product name = #{@products[id][:name]}"
      puts "Product price = #{@products[id][:price]}"
      puts "Product quantity = #{@products[id][:quantity]}"
    else
      puts 'product not found'
    end
  end

  def cal_cost
    @total = 0
    @products.each do |_, details|
      @total += (details[:price] * details[:quantity])
    end
    puts "Total Inventory = #{@total}"
  end

  def display
    print "\n"
    puts '----------- Inventory List -------------'
    print "\n"
    puts format('%-10s %-20s %-20s %-20s', 'ID', 'NAME', 'PRICE', 'QUANTITY')

    @products.each do |id, details|
      puts format(
        '%-10s %-20s %-20s %-20s',
        id,
        details[:name],
        details[:price],
        details[:quantity]
      )
    end
  end
end
inventory = Inventory.new

inventory.add_product(1, 'Laptop', 50_000, 2)
inventory.add_product(2, 'Mouse', 1500, 5)
inventory.add_product(3, 'Keyboard', 3000, 4)

inventory.display
inventory.search_product(3)
inventory.delete_product(2)
inventory.cal_cost
