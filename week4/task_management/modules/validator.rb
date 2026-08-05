require_relative '../utils/file_manager'
module Validator
  # project status validator
  def project_status_validator(choice)
    !%w[planning active completed archived].include?(choice.downcase)
  end

  def name_validator(choice)
    return unless choice == '' || choice == nil?

    true
  end

  def desc_validator(choice)
    return unless choice == '' || choice == nil?

    true
  end

  def id_check(choice)
    projects = FileManager.read_json('data/project.json')
    projects.find { |p| p['id'] == choice }
  end
end
