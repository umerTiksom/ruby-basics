require_relative './menu'
class School
  def initialize
    @menu = Menu.new
  end

  def start
    @menu
  end
end
