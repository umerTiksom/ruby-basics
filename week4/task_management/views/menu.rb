require_relative '../services/projects_services'
require_relative '../modules/validator'
require_relative '../views/project_menu'
require_relative '../services/tasks_services'
require_relative '../views/task_menu'
require 'colorize'
require 'date'
class Menu
  include Validator
  attr_accessor :user_input

  def initialize(project_service, task_service)
    @project = Project_menu.new(project_service)
    @task = Task_menu.new(task_service)
  end

  def start
    puts
    puts '=' * 30
    puts 'Task Management System '
    puts '=' * 30
    puts
    puts 'Press 1 to see the Project Menu '
    puts 'Press 2 to see the Task Menu '
    puts
    puts 'Enter the number = '
    user_input = gets.chomp.to_i

    if user_input == 1
      @project.start
    elsif user_input == 2
      @task.start
    else
      puts
      puts 'Invalid choice ...'.red
    end
  end
end
