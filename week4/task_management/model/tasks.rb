# task model
class Task
  attr_accessor :id, :title, :description, :project_id, :status, :priority, :due_date, :created_date

  def initialize(id, title, description, project_id, status, priority, due_date, created_date)
    @id = id
    @title = title
    @description = description
    @project_id = project_id
    @status = status
    @priority = priority
    @due_date = due_date
    @created_date = created_date
  end

  def to_hash
    {
      id: @id,
      title: @title,
      description: @description,
      project_id: @project_id,
      status: @status,
      priority: @priority,
      due_date: @due_date,
      created_date: @created_date

    }
  end
end
