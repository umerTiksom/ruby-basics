require_relative 'person'
class Student < Person
  attr_accessor :roll_number, :classroom, :marks

  def initialize(s_id, s_name, s_age, s_gender, s_classroom, s_marks)
    super(s_id, s_name, s_age, s_gender)
    @roll_no = s_id
    @classroom = s_classroom
    @marks = s_marks
  end
end
