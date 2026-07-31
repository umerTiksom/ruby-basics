require_relative '../models/student'
require_relative '../modules/printable'

class StudentService
  include Printable

  attr_reader :students

  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
    success('Student added successfully.')
  end

  def list_students
    if @students.empty?
      error('No students available.')
      return
    end

    @students.each do |student|
      puts
      student.display
    end
  end

  def search_student(roll_number)
    return unless @students.find { |student| student.roll_number == roll_number }

    puts 'Student found successfully'.green
  end

  def update_marks(roll_number, marks)
    student = search_student(roll_number)

    if student
      student.marks = marks
      success('Marks updated successfully.')
    else
      error('Student not found.')
    end
  end

  def delete_student(roll_number)
    student = search_student(roll_number)

    if student
      @students.delete(student)
      success('Student deleted successfully.')
    else
      error('Student not found.')
    end
  end
end
