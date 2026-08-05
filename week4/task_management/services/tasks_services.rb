require_relative '../model/tasks'
require 'colorize'
require 'date'
require_relative '../modules/validator'
require_relative '../utils/file_manager'
class Task_services
  include Validator
  # create task
  def create_task(tittle, description, p_id, priority, due_date)
    tasks = FileManager.read_json('data/task.json')

    # Auto Increment ID
    next_id = if tasks.empty?
                1
              else
                tasks.last['id'].to_i + 1
              end

    new_task = Task.new(
      next_id,
      tittle,
      description,
      p_id,
      'pending',
      priority,
      due_date,
      Date.today
    )

    tasks << new_task.to_hash

    # Wapas file me save karo
    FileManager.write_json('data/task.json', tasks)
    puts
    puts 'Task created successfully!'.green
  end

  # list all the task
  def list_task
    tasks = FileManager.read_json('data/task.json')
    projects = FileManager.read_json('data/project.json')
    puts
    puts('=' * 40)
    print(' ' * 13)
    puts 'List Tasks'
    puts('=' * 40)
    puts
    puts format('%-5s %-25s %-25s %-25s %-25s', 'ID', 'Title', 'Project', 'Priority', 'Status').yellow
    puts '-' * 100
    tasks.each do |t|
      project = projects.find { |p| p['id'] == t['project_id'] }
      project_name = project ? project['name'] : 'unknown'
      puts format(
        '%-5s %-25s %-25s %-25s %-25s',
        t['id'],
        t['title'],
        project_name,
        t['priority'],
        t['status']
      )
    end
  end

  # view the task details
  def view_task_details(id)
    tasks = FileManager.read_json('data/task.json')
    projects = FileManager.read_json('data/project.json')
    task = tasks.find { |task| task['id'] == id }
    if task.nil?
      puts 'Task not found!'.red
      return
    end
    project = projects.find { |p| p['id'] == task['project_id'] }
    @name = project['name']
    puts
    puts ('=' * 30).yellow
    puts 'Task Details'
    puts ('=' * 30).yellow
    puts "Title : #{task['title']}"
    puts "Project : #{@name}"
    puts "Priority : #{task['priority']}"
    puts "Status  : #{task['status']}"
    puts "Due Date      : #{task['due_date']}"
    puts "Created At : #{task['created_date']}"
  end

  # update task
  def update_task(id, data, choice)
    tasks = FileManager.read_json('data/task.json')
    task = tasks.find { |t| t['id'] == id }
    if task.nil?
      puts 'Task not found'.red
      return
    end
    if choice == 1
      task['title'] = data
    elsif choice == 2
      task['description'] = data
    elsif choice == 3
      task['priority'] = data
    elsif choice == 4
      task['status'] = data
    end
    FileManager.write_json('data/task.json', tasks)
    puts
    puts 'Task updated successfully'.green
  end

  # complete the task
  def complete_task(id)
    tasks = FileManager.read_json('data/task.json')

    task = tasks.find { |t| t['id'] == id }

    if task.nil?
      puts 'Task not found.'
      return
    end

    if task['status'].downcase == 'completed'
      puts "Task ##{task_id} is already completed."
      return
    end

    task['status'] = 'completed'

    FileManager.write_json('data/task.json', tasks)

    puts "Task ##{id} marked as completed."
  end
end
