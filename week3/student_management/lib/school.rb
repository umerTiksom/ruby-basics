require_relative './menu'
require_relative './models/person'
require_relative './models/student'
require_relative './models/teacher'

require_relative './modules/printable'
require_relative './modules/validator'
class School
  def initialize
    @menu = Menu.new
  end

  def start
    @menu.start
  end
end
