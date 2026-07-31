require_relative 'person'
class Teacher < Person
  attr_accessor :salary, :class_assign

  def initialize(t_id, t_name, t_age, t_gender, t_salary, t_class_assign)
    super(t_id, t_name, t_age, t_gender)
    @salary = t_salary
    @class_assign = t_class_assign
  end
end
