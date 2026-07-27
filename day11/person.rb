class Person
  attr_accessor :name, :age

  def initialize(p_name, p_age)
    @name = p_name
    @age = p_age
  end
end

person1 = Person.new('umer', 24)
person2 = Person.new('ali', 20)
person3 = Person.new('Taha', 23)

puts person1.name
person2.name = 'ahmed'
puts person2.name
puts person3.name
