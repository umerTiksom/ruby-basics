require 'colorize'
require 'date'
require_relative '../modules/validator'
class Task_menu
  include Validator
  def initialize(task_service)
    @task_services = task_service
  end

  def start
    puts ('=' * 40).green
    puts 'Task Menu '
    puts ('=' * 40).green
    puts 'Press 1 for creating the task '
    puts 'Press 2 for see the task listing'
    puts 'Press 3 for view the task details'
    puts 'Press 4 for update the task '
    puts 'Press 5 for mark task as Complete'
    puts
    puts 'Enter the number = '
    @user_input = gets.chomp.to_i
    # user option to create the task
    if @user_input == 1

      puts 'Enter the task tittle = '.blue
      @tittle = gets.chomp.to_s
      puts
      puts 'Enter the task description = '.blue
      @description = gets.chomp.to_s
      puts 'Enter the project id = '
      @p_id = gets.chomp.to_i
      puts 'Enter the task priority [Low, Medium, High]'
      @priority = gets.chomp.to_s.downcase
      puts 'Enter Due Date (YYYY-MM-DD):'
      @due_date = Date.parse(gets.chomp)
      id_check = id_check(@p_id)
      unless id_check
        puts 'Id does not match'.red
        exit
      end
      flag = task_priority_validator(@priority)
      #  validate project status
      if flag == true
        puts
        puts ' you enter invalid Priority'.red
        exit
      end
      tittle_flag = name_validator(@tittle)
      desc_flag = desc_validator(@description)
      if tittle_flag == true || desc_flag == true
        puts 'Feilds must be filled'.red
        exit
      end
      @task_services.create_task(@tittle, @description, @p_id, @priority, @due_date)
    elsif @user_input == 2
      @task_services.list_task
    end
  end
end
