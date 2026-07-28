class Student
  @@student_count = 0
  def initialize(name, id)
    @@student_count += 1
    @name = name
    @id = id
  end

  def display
    puts "student name = #{@name}"
    puts " student id = #{@id}"
  end

  def self.str_counter
    puts "Number of students present in the student class are = #{@@student_count}"
  end
end
s1 = Student.new('umer', 1)
s2 = Student.new('ali', 2)
print "\n"
puts '----- Student List ----------'
print "\n"
s1.display
print "\n"
s2.display

print "\n"
Student.str_counter
print "\n"
