require 'faker'
require 'colorize'

require_relative './models/teacher'
require_relative './models/student'

class Menu
  def initialize(student_service, teacher_service)
    @student_service = student_service
    @teacher_service = teacher_service
  end

  def start
    puts 'Menu Started'.green

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

    @student_service.add_student(student)
    @teacher_service.add_teacher(teacher)

    puts "\nStudents".blue
    @student_service.list_students

    puts "\nTeachers".blue
  end
end
