require_relative 'person'
require_relative '../modules/printable'
require_relative '../modules/validator'
class Student < Person
  include Validator
  include Printable
  attr_accessor :roll_number, :classroom, :marks

  def initialize(s_id, s_name, s_age, s_gender, s_classroom, s_marks)
    super(s_id, s_name, s_age, s_gender)
    @roll_no = s_id
    @classroom = s_classroom
    @marks = s_marks
  end

  def grade
    case @marks
    when 90..100
      'A+'
    when 80...90
      'A'
    when 70...80
      'B'
    when 60...70
      'C'
    when 50...60
      'D'
    else
      'Fail'
    end
  end

  def display
    print_heading('Student List')
    super
    puts "Roll No : #{@roll_number}"
    puts "Class   : #{@classroom}"
    puts "Marks   : #{@marks}"
    puts "Grade   : #{grade}"
  end
end
