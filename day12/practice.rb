# access modifiers practice
class Student
  attr_accessor :roll_no

  def initialize(roll_no)
    @roll_no = roll_no
  end

  def display
    puts "student roll number is = #{roll_no}"
  end
end
s1 = Student.new(120)
s1.display
puts("roll for this student is = #{s1.roll_no}")
s1.roll_no = 130
s1.display

# class methoods
# self
class Person
  # this function show the class display
  def self.display
    puts 'this is the person classs'
  end
end
Person.new
print "\n"
Person.display

# multiples class methoods
class Employee
  @obj = 10

  # this syntax is used to add the multiple methoods in the class methoods
  class << self
    def info
      puts 'this is the employee class'
    end

    def object_created(object)
      @obj = object
      puts "number of object created in employee class is = #{@obj}"
    end
  end
end
print "\n"
puts 'Outputs for the employee class methoods'
Employee.info
Employee.object_created(30)
