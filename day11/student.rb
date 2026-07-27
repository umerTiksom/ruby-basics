class Student
  def initialize()
    @name = ""
    @department = ""
  end
  
  def setName(name)
    @name = name
  end
  
  def setDepartment(department)
    @department = department
  end
  
  def getName()
    @name
  end
  
  def getDepartment()
    @department
  end
end

student1 = Student.new()
student1.setName("umer")
student1.setDepartment("FOIT")

puts ("Student name is "+student1.getName)
puts ("Student department is "+student1.getDepartment)