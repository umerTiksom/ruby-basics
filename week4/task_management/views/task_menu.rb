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
    puts 'Press 6 for delete the task'
    puts 'Press 7 for search the task'
    puts 'Press 8 for filter the task'
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
      puts
      puts 'Enter the project id = '.blue
      @p_id = gets.chomp.to_i
      puts
      puts 'Enter the task priority [Low, Medium, High]'.blue
      @priority = gets.chomp.to_s.downcase
      puts
      puts 'Enter Due Date (YYYY-MM-DD):'.blue
      @due_date = Date.parse(gets.chomp)
      id_check = id_check(@p_id)
      unless id_check
        puts
        puts 'Id does not match'.red
        return
      end
      flag = task_priority_validator(@priority)
      #  validate project status
      if flag == true
        puts
        puts ' you enter invalid Priority'.red
        return
      end
      tittle_flag = name_validator(@tittle)
      desc_flag = desc_validator(@description)
      if tittle_flag == true || desc_flag == true
        puts
        puts 'Feilds must be filled'.red
        return
      end
      @task_services.create_task(@tittle, @description, @p_id, @priority, @due_date)
    # list all the task
    elsif @user_input == 2
      @task_services.list_task
    # list the task details
    elsif @user_input == 3
      puts
      puts 'Enter the task id '
      id = gets.chomp.to_i
      @task_services.view_task_details(id)

    elsif @user_input == 4
      puts ('=' * 30).green
      puts 'Update Task'
      puts ('=' * 30).green
      puts
      puts 'Press 1 for Title Update'
      puts 'Press 2 for Description Update '
      puts 'Press 3 for Priority Update'
      puts 'Press 4 for Status Update'
      puts
      puts 'Enter the task id = '
      id = gets.chomp.to_i
      id_check = task_id_check(id)
      unless id_check
        puts
        puts 'Id does not match'.red
        return
      end
      puts
      puts 'Enter the choice = '
      @update_choice = gets.chomp.to_i
      # Tittle update call
      if @update_choice == 1
        puts
        puts 'Enter the new Title: '
        @tittle = gets.chomp.downcase
        @task_services.update_task(id, @tittle, @update_choice)
      elsif @update_choice == 2
        puts
        puts 'Enter the new Decription: '
        @decs = gets.chomp.downcase
        @task_services.update_task(id, @tittle, @update_choice)
      elsif @update_choice == 3
        puts
        puts 'Enter the new Priority [Low, Medium, High]: '
        @priority = gets.chomp.downcase
        flag = task_priority_validator(@priority)
        #  validate project status
        if flag == true
          puts
          puts ' you enter invalid Priority'.red
          return
        end
        @task_services.update_task(id, @tittle, @update_choice)
      elsif @update_choice == 4
        puts
        puts 'Enter the new Status [Pending, In Progress, Completed] :'
        @status = gets.chomp.downcase
        flag = project_status_validator(@status)
        if flag
          puts
          puts 'you enter invalid status'.red
          return
        end

        @task_services.update_task(id, @tittle, @update_choice)
      else

        puts 'invalid Task update choice'
      end

    elsif @user_input == 5
      print 'Enter Task ID = '
      task_id = gets.chomp.to_i
      id_check = task_id_check(task_id)
      unless id_check
        puts 'Id does not match'.red
        return
      end
      @task_services.complete_task(task_id)

    #  delete the task
    elsif @user_input == 6
      puts
      puts 'Enter the task id for delete '
      @delete_task_id = gets.chomp.to_i
      flag = task_id_check(@delete_task_id)
      unless flag
        puts 'Task Id not match'.red
        return
      end
      @task_services.delete_task(@delete_task_id)

      # search by keyword from the task
    elsif @user_input == 7
      puts
      puts 'Search: '.blue
      search_choice = gets.chomp.to_s.downcase
      @task_services.search_by_keyword(search_choice)
    elsif @user_input == 8
      puts
      puts 'Press 1 for filter task by description'
      puts 'Press 2 for filter task by priority'
      puts
      puts 'Enter the filter choice = '
      filter_choice = gets.chomp.to_i
      if filter_choice == 1
        puts
        puts 'Enter the filter keyword = '
        @filter_input = gets.chomp.to_s.downcase
        error = desc_validator(@filter_input)
        if error == true
          puts 'Description must be filled'
        else
          @task_services.filter_task(@filter_input, filter_choice)
        end

      elsif filter_choice == 2
        puts 'Enter the filter priority [Low, Medium, High] = '
        @filter_input = gets.chomp.to_s.downcase
        error = task_priority_validator(@filter_input)
        if error == true
          puts 'You Enter invalid priority.....'.red
          nil
        else
          @task_services.filter_task(@filter_input, filter_choice)
        end
      else
        puts 'Invalid option...'.red
        nil
      end

    end
  end
end
