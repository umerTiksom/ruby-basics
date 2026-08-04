# project class
class Project
  attr_accessor :id, :name, :description, :status, :created_date

  def initialize(id, name, description, status, created_date)
    @id = id
    @name = name
    @description = description
    @status = status
    @created_date = created_date
  end

  # convert the class object data into hash
  def to_hash
    {
      id: @id,
      name: @name,
      description: @description,
      status: @status,
      created_date: @created_date
    }
  end
end
