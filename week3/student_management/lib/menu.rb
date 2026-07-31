require 'faker'
require 'colorize'
require_relative 'models/student'
require_relative 'models/teacher'
class Menu
  def start
    puts 'menu started'
    student = Student.new(
      101,
      Faker::Name.name,
      rand(15..20),
      %w[Male Female].sample,
      '10th',
      rand(20..100)
    )
    teacher = Teacher.new(
      201,
      Faker::Name.name,
      rand(30..55),
      %w[Male Female].sample,
      rand(70_000..150_000),
      Faker::Educator.subject
    )

    student.display

    puts

    teacher.display

    puts
    if student.valid_marks?(student.marks)
      student.success('Student data is valid.')
    else
      student.error('Student marks are invalid.')
    end
  end
end
