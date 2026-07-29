class Employee
  def initialize(id, name, salary)
    @id = id
    @name = name
    @salary = salary
    puts 'Employee call'
  end

  def work
    puts 'Employee is working'
  end
end

class Manager < Employee
  def initialize(id, name, salary, team_size)
    super(id, name, salary)
    @team_size = team_size
    puts 'manager call'
  end

  def work
    puts "Manager is working with the #{@team_size} team members"
  end

  def display
    puts 'Manager'
    print "\n"
    puts "Name of Manager = #{@name}"
    puts "Salary of Manager = #{@salary}"
    puts "Team size assign to the manager = #{@team_size}"
  end
end

class Developer < Employee
  def initialize(id, name, salary, language)
    super(id, name, salary)
    @language = language
    puts 'developer call'
  end

  def work
    puts "Developer is working on #{@language} language"
  end

  def display
    puts 'Developer'
    print "\n"
    puts "Name of developer = #{@name}"
    puts "Salary of developer = #{@salary}"
    puts "Developer language = #{@language}"
  end
end

class Designer < Employee
  def initialize(id, name, salary, tool)
    super(id, name, salary)
    @tool = tool
    puts 'Designer call'
  end

  def work
    puts "Designer is working on #{@tool} tool"
  end

  def display
    puts 'Designer'
    print "\n"
    puts "Name of Designer = #{@name}"
    puts "Salary of Designer = #{@salary}"
    puts "Designer tool = #{@tool}"
  end
end
e1 = Developer.new(1, 'Umer', 50_000, 'ruby')
e2 = Designer.new(1, 'Ali', 100_000, 'figma')
e1.work
e2.work
employees = [e1, e2]
print "\n"
puts '--------- Employee list ----------'
print "\n"
employees.each do |emp|
  emp.display
  print "\n"
end
