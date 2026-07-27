class Teacher
  def initialize
    @name
    @age
    @salary
  end
  def setTeacherData(name,age,salary)
    @name =name.to_s
    @age = age.to_s
    @salary = salary.to_s
  end
  def displayData()
    puts ("teacher name = "+@name)
    puts ("teacher age = "+@age)
    puts ("teacher salary = "+@salary)
  end
end
teacher1=Teacher.new()
teacher1.setTeacherData("Ali",25,25000)
teacher1.displayData()
teacher2=Teacher.new()
teacher2.setTeacherData("Ahmed",30,25000)
teacher1.displayData()