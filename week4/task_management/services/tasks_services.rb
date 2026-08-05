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
end
