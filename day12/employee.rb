# creating employee class using accessers
class Employee
  attr_accessor :emp_department, :emp_phone_no
  attr_writer :emp_id, :emp_name, :emp_salary

  # @emp_phone_no = :emp_phone_no
  # @emp_department = :emp_department
  def initialize(id, name, salary)
    @emp_id = id
    @emp_name = name
    @emp_salary = salary
  end

  def display_info
    print "\n"
    puts '------Employee Information--------'
    puts "Employee Id = #{@emp_id}"
    puts "Employee Name = #{@emp_name}"
    puts "Employee phone number = #{emp_phone_no}"
    puts "Employee department = #{emp_department}"
    print "\n"
  end
end
e1 = Employee.new(1, 'umer', 25_000)
e1.emp_department = 'FOIT'
e1.emp_phone_no = '0310-1412139'
puts 'Employee created successfully '
puts "Employee department #{e1.emp_department} and employee phone number is = #{e1.emp_phone_no}"
print "\n"
e1.display_info
