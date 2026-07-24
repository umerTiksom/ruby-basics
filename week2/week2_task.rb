# employee management system
def add_employee(employees)
  puts 'Enter the employee id = '
  emp_id = gets.chomp.to_s
  puts 'Enter the employee name = '
  emp_name = gets.chomp.to_s
  puts 'Enter the employee age = '
  emp_age = gets.chomp.to_i
  puts 'Enter the employee designation = '
  emp_des = gets.chomp.to_s
  puts 'Enter the employee department = '
  emp_department = gets.chomp.to_s
  search = employees.find do |_, details|
    details[:emp_id] == emp_id
  end
  if search
    puts 'Employee with this id already exist'

  else
    employees[:"employee#{employees.length + 1}"] = {
      emp_id: emp_id,
      name: emp_name,
      age: emp_age,
      designation: emp_des,
      department: emp_department
    }
    puts 'Employee Add successfully'
  end
end

def search_employee(employees)
  puts 'Enter the employee id = '
  emp_id = gets.chomp.to_s
  key = employees.find do |_, details|
    details[:emp_id] == emp_id
  end
  if key
    puts 'Employee is found'
    print "\n"
    puts "Employee id = #{employees[key[0]][:emp_id]}"
    puts "Name = #{employees[key[0]][:name]}"
    puts "Age = #{employees[key[0]][:age]}"
    puts "Designation = #{employees[key[0]][:designation]}"
    puts "Department = #{employees[key[0]][:department]}"
    print "\n"
  else
    puts ' Employee is not found'
  end
end

def delete_employee(employees)
  puts 'Enter the employee id = '
  emp_id = gets.chomp.to_s
  key = employees.find do |_, details|
    details[:emp_id] == emp_id
  end
  if key
    employees.delete(key[0])
    puts 'Employee delete successfully'
  else
    puts 'Employee not found'
  end
end

def display_employee(employees)
  puts '----LIST OF THE EMPLOYEES------'
  print "\n"
  employees.each do |_, detail|
    detail.each do |key, value|
      puts "#{key}:  #{value}"
    end
    puts '....................'
  end
end
employees = {
  employee1: {
    emp_id: 'tk01',
    name: 'Muhammad Umer',
    age: 24,
    designation: 'Ruby On Rails',
    department: 'Tech'
  }
}
loop do
  puts 'Welcome to Employees Management System'
  puts 'Press 1 to add new employee'
  puts 'Press 2 to search employee'
  puts 'Press 3 to delete employee'
  puts 'Press 4 to display employees'
  puts 'Press 0 to exit the system'
  print "\n"
  puts 'Enter the number = '
  user_input = gets.chomp.to_i
  case user_input
  when 0
    puts ' SYSTEM LOGOUT SUCCESSFULLY'
    break
  when 1
    add_employee(employees)
  when 2
    search_employee(employees)
  when 3
    delete_employee(employees)
  when 4
    display_employee(employees)
  else
    puts 'you enter invalid number'
    break
  end
end
