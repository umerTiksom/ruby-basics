class Person
  attr_accessor :id, :name, :age, :gender

  def initialize(p_id, p_name, p_age, p_gender)
    @id = p_id
    @name = p_name
    @age = p_age
    @gender = p_gender
  end

  def display
    puts "Name: #{@name}"
    puts "Age: #{@age}"
    puts "Gender: #{@gender}"
  end
end
