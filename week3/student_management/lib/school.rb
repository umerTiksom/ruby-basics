require_relative './menu'
require_relative './models/person'
require_relative './models/student'
require_relative './models/teacher'
class School
  def initialize
    @menu = Menu.new
  end

  def start
    @menu
  end
end
