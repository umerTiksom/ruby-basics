require 'faker'
require 'colorize'

require_relative './models/teacher'
require_relative './models/student'
require_relative './modules/printable'
class Menu
  include Printable
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

    # puts "\nStudents".blue
    # @student_service.list_students

    # puts "\nTeachers".blue
    print_heading('School Management System')
    loop do
      puts
      puts 'Press 1 for add student'
      puts 'Press 2 for search student '
      puts 'Press 3 for delete the student '
      puts 'Press 4 for display the students list '
      puts
      puts
      puts 'Press 5 for add teacher'
      puts 'Press 6 for search teacher '
      puts 'Press 7 for delete the teacher '
      puts 'Press 8 for display the teachers list '
      puts 'Press 0 for exit'
      puts
      puts 'Enter the number = '
      @user_input = gets.chomp.to_i

      # add student
      if @user_input == 1
        student = Student.new(
          103,
          Faker::Name.name,
          rand(15..20),
          %w[Male Female].sample,
          '10th',
          rand(20..100)
        )
        @student_service.add_student(student)
      elsif @user_input == 2
        puts 'enter the roll numbers of student for search = '
        @user_id = gets.chomp.to_i
        @student_service.search_student(@user_id)
      elsif @user_input == 3
        puts 'enter the roll number of student for delete = '
        @user_id = gets.chomp.to_i
        @student_service.delete_student(@user_id)
      elsif @user_input == 4
        @student_service.list_students
      elsif @user_input == 5
        teacher = Teacher.new(
          202,
          Faker::Name.name,
          rand(30..55),
          %w[Male Female].sample,
          rand(70_000..150_000),
          Faker::Educator.subject
        )
        @teacher_service.add_teacher(teacher)
      elsif @user_input == 6
        puts 'enter the teacher id for search = '
        @user_id = gets.chomp.to_i
        @teacher_service.search_teacher(@user_id)
      elsif @user_input == 7
        puts 'enter the teacher id for delete = '
        @user_id = gets.chomp.to_i
        @teacher_service.delete_teacher(@user_id)
      elsif @user_input == 8
        @teacher_service.list_teachers
      elsif @user_input == 0
        puts 'You are successfully logout '
        exit
      else
        exit
      end
    end
  end
end
