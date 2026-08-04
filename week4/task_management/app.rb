require_relative 'model/projects'
require_relative 'utils/file_manager'
require_relative 'model/tasks'
require_relative 'views/menu'
require 'date'
require_relative 'services/projects_services'
@project_service = Project_services.new
menu = Menu.new(@project_service)
menu.start
