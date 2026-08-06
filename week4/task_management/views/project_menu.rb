require_relative '../services/projects_services'
require_relative '../modules/validator'
require 'colorize'
require 'date'
class Project_menu
  include Validator

  def initialize(project_service)
    @project_services = project_service
  end

  def start
    puts ('=' * 40).green
    puts 'Project Menu '.green
    puts ('=' * 40).green
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
      flag = project_status_validator(@status)
      #  validate project status
      if flag == true
        puts
        puts ' you enter invalid status'.red
        exit
      end
      name_flag = name_validator(@name)
      desc_flag = desc_validator(@description)
      if name_flag == true || desc_flag == true
        puts
        puts 'input feilds must be filled'.red
        exit
      end
      @project_services.create_project(@name, @description, @status)

    # list all the projects
    elsif @user_input == 2
      @project_services.list_projects

    # display the project details
    elsif @user_input == 3
      puts 'Enter project id for details = '
      id = gets.chomp.to_i
      id_flag = id_check(id)
      unless id_flag
        puts 'Id does not match'.red
        exit
      end
      @project_services.view_project(id)

    # update the project details
    elsif @user_input == 4
      # update_project
      puts 'Enter Project id ='
      id = gets.chomp.to_i

      puts 'Enter new name = '
      name = gets.chomp

      puts 'Enter new description = '
      description = gets.chomp

      puts 'Enter new status (Planning/Active/Completed) = '
      status = gets.chomp
      status_flag = project_status_validator(status)
      if status_flag == true
        puts 'Enter invalid status'.red
        exit
      end
      @project_services.update_project(id, name, description, status)
    elsif @user_input == 5
      puts 'Enter Project ID to delete:'
      id = gets.chomp.to_i
      id_flag = id_check(id)
      unless id_flag
        puts 'Id does not match'.red
        exit
      end
      @project_services.delete_project(id)
    end
  end
end
