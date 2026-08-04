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
end
