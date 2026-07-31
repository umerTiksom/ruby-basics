require_relative './menu'

require_relative './models/person'
require_relative './models/student'
require_relative './models/teacher'

require_relative './modules/validator'
require_relative './modules/printable'

require_relative './services/student_service'
require_relative './services/teacher_service'

class School
  def initialize
    @student_service = StudentService.new
    @teacher_service = TeacherService.new

    @menu = Menu.new(@student_service, @teacher_service)
  end

  def start
    @menu.start
  end
end
