class Product
  attr_reader :product_name
  attr_writer :product_price

  def initialize(p_name, p_price)
    @product_name = p_name
    @product_price = p_price
  end

  private

  def tax_calculation
    @tax = 1.4
    @fbr = 0.8
    @product_price = @product_price * @tax * @fbr
  end

  public

  def display_product
    puts "Product Name = #{@product_name}"
    puts "Product Price berfore tax = #{@product_price}"
    @result = tax_calculation
    puts "Product price after tax calculation = #{@result}"
  end
end
p1 = Product.new('Keyboard', 2000)
p1.display_product
