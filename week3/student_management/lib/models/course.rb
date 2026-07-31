class Course
  attr_accessor c_id, c_name, teach_by

  def initialize(id, name, teach)
    @c_id = id
    @c_name = name
    @teach_by = teach
  end
end
