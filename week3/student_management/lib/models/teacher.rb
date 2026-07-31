require_relative './person'
require_relative '../modules/validator'
require_relative '../modules/printable'
class Teacher < Person
  include Validator
  include Printable
  attr_accessor :salary, :subject

  def initialize(t_id, t_name, t_age, t_gender, t_salary, t_subject)
    super(t_id, t_name, t_age, t_gender)
    @salary = t_salary
    @subject = t_subject
  end

  def display
    print_heading('Teacher Details')
    super
    puts "Subject     : #{@subject}"
    puts "Salary      : #{@salary}"
  end
end
