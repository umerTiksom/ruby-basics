require_relative '../services/projects_services'
require 'colorize'
require 'date'
class Menu
  attr_accessor :user_input

  def initialize(project_service)
    @project_services = project_service
    # @task_services = task_services
  end

  def start
    puts '--------Task Management System---------'
    puts
    puts 'Press 1 for Create project '
    puts 'Press 2 for list of projects'
    puts 'Press 3 for view the project detail'
    puts 'Press 4 for update the project '
    puts 'Press 5 for delete project '

    puts
    puts 'Enter the choice = '
    @user_input = gets.chomp.to_i
    # creatong of project
    if @user_input == 1
      puts 'Enter the project name = '.blue
      @name = gets.chomp.to_s
      puts
      puts 'Enter the project description = '.blue
      @description = gets.chomp.to_s
      puts 'enter the project status [Planning, Active, Completed, Archived]'.blue
      @status = gets.chomp.to_s.downcase

      #  validate project status
      if @status != 'planning' && @status != 'active' && @status != 'complete' && @status != 'archived'
        puts
        puts ' you enter invalid status'.red
        exit
      end
      if @name == '' || @description == ''
        puts
        puts 'input feilds must be filled'.red
        exit
      end
      @project_services.create_project(@name, @description, @status)
    elsif @user_input == 2
      @project_services.list_projects
    elsif @user_input == 3
      # view_project
      puts 'view the project detail'
    elsif @user_input == 4
      # update_project
      puts 'update the project detail'
    elsif @user_input == 5
      # delete_project
      puts 'Delete the project '
    end
  end
end
