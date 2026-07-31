require_relative '../models/teacher'
require_relative '../modules/printable'

class TeacherService
  include Printable

  attr_reader :teachers

  def initialize
    @teachers = []
  end

  def add_teacher(teacher)
    @teachers << teacher
    success('Teacher added successfully.')
  end

  def list_teachers
    if @teachers.empty?
      error('No teachers available.')
      return
    end

    @teachers.each do |teacher|
      puts
      teacher.display
    end
  end

  def search_teacher(id)
    @teachers.find { |teacher| teacher.id == id }
  end

  def delete_teacher(id)
    teacher = search_teacher(id)

    if teacher
      @teachers.delete(teacher)
      success('Teacher deleted successfully.')
    else
      error('Teacher not found.')
    end
  end
end
