require_relative 'model/projects'
require_relative 'utils/file_manager'
require_relative 'model/tasks'
require_relative 'views/menu'
require 'date'
require 'colorize'
require_relative 'services/projects_services'
@project_service = Project_services.new
@task_service = Task_services.new
menu = Menu.new(@project_service, @task_service)
loop do
  menu.start
  puts 'Press 0 to exit the system or press any key to move to main menu '
  @user_choice = gets.chomp.to_i
  if @user_choice == 0
    puts 'Exit System Successfully...'.green
    exit
  end
end
