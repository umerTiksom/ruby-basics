require_relative 'person'
class Teacher < Person
  attr_accessor :salary, :subject

  def initialize(t_id, t_name, t_age, t_gender, t_salary, t_subject)
    super(t_id, t_name, t_age, t_gender)
    @salary = t_salary
    @subject = t_subject
  end

  def display
    super
    puts "Subject     : #{@subject}"
    puts "Salary      : #{@salary}"
  end
end
