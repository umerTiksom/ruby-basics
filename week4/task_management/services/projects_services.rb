require_relative '../model/projects'
require_relative '../utils/file_manager'
require 'date'
require 'colorize'

class Project_services
  # feature 1
  def create_project(name, description, status)
    # File se existing projects read karo
    projects = FileManager.read_json('data/project.json')

    # Auto Increment ID
    next_id = if projects.empty?
                1
              else
                projects.last['id'].to_i + 1
              end

    # Naya project banao
    project = Project.new(
      next_id,
      name,
      description,
      status,
      Date.today
    )

    # Array me add karo
    projects << project.to_hash

    # Wapas file me save karo
    FileManager.write_json('data/project.json', projects)
    puts
    puts 'Project created successfully!'.green
    puts "Project ID: #{next_id}".green
  end

  # Feature 2 list all the project
  def list_projects
    projects = FileManager.read_json('data/project.json')
    puts
    puts ('=' * 30).yellow
    puts 'List of Projects'.yellow
    puts ('=' * 30).yellow
    puts
    if projects.empty?
      puts 'No projects found!'.green
      return
    end

    puts format('%-5s %-25s %-15s', 'ID', 'Project', 'Status')
    puts '-' * 60

    projects.each do |project|
      puts format(
        '%-5s %-25s %-15s',
        project['id'],
        project['name'],
        project['status']
      )
    end
    puts
  end

  # feature 3
  def view_project(id)
    projects = FileManager.read_json('data/project.json')
    tasks = FileManager.read_json('data/task.json')

    project = projects.find { |p| p['id'] == id }

    if project.nil?
      puts 'Project not found!'.red
      return
    end
    project_tasks = tasks.select { |task| task['project_id'] == id }
    total_tasks = project_tasks.count
    completed_tasks = project_tasks.count do |task|
      task['status'].downcase == 'completed'
    end
    pending_tasks = total_tasks - completed_tasks

    progress = if total_tasks.zero?
                 0
               else
                 (completed_tasks.to_f / total_tasks * 100).to_i
               end

    puts
    puts ('=' * 30).yellow
    puts 'Project Details'
    puts ('=' * 30).yellow
    puts "Project : #{project['name']}"
    puts "Status  : #{project['status']}"
    puts
    puts "Tasks      : #{total_tasks}"
    puts "Completed : #{completed_tasks}"
    puts "Pending   : #{pending_tasks}"
    puts
    puts "Progress : #{progress}%"
    puts '=' * 30
  end

  def update_project(id, name, des, status)
    projects = FileManager.read_json('data/project.json')

    project = projects.find { |p| p['id'] == id }

    if project.nil?
      puts 'Project not found!'.red
      return
    end

    project['name'] = name
    project['description'] = des
    project['status'] = status

    FileManager.write_json('data/project.json', projects)

    puts
    puts 'Project updated successfully!'.green
  end

  def delete_project(id)
    projects = FileManager.read_json('data/project.json')

    project = projects.find { |p| p['id'] == id }

    if project.nil?
      puts 'Project not found!'.red
      return
    end

    puts
    print "Are you sure you want to delete project ##{id}? (y/n): ".red
    choice = gets.chomp.downcase

    if choice == 'y'
      projects.reject! { |p| p['id'] == id }

      FileManager.write_json('data/project.json', projects)

      puts 'Project deleted successfully!'.green
    elsif choice == 'n'
      puts 'Deletion cancelled.'.green
    else
      puts 'Enter invalid Choice'.red
    end
  end
end
