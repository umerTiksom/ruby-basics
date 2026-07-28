# practice the public private and protected methoods
class Student
  def initialize(name, id)
    @name = name
    @id = id
  end

  # by defaulf methoods are public
  def dislpay
    puts "Name = #{@name}"
    puts "Id = #{@id}"
  end

  def marks_display
    calculate_marks
  end

  def check_id(obj)
    return unless id == obj.id

    puts 'id is match with the other student '
  end
  # private methoods

  private

  def calculate_marks
    @eng = 90
    @sci = 80
    @isl = 75
    @total = @eng + @sci + @isl
    puts "total marks of this student is = #{@total}"
  end

  protected

  attr_reader :id
end
s1 = Student.new('umer', 101)
s1.marks_display
# s1.calculate_marks   can not call private methood outside the class
s2 = Student.new('ali', 101)
s1.check_id(s2)
