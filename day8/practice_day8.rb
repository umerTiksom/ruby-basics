# if else statement example

number = 0
print 'Enter the number = '
number = gets.chomp.to_i
if number.even?
  puts 'number is even'

else
  puts 'number is odd'
end

# case example
number = 0
print 'emter the number = '
number = gets.chomp.to_i
if number == 0
  puts 'you enter the number 0 '
elsif number.even?
  puts 'number is even'
else
  puts 'number is odd'
end

num = 0
while num < 5
  puts "this is #{num} iteration"
  num += 1
end

# time loops
5.times do
  puts 'hello'
end

num = 5

for i in 1..num do
  puts 'Welcome'

end

num = [1, 2, 3]
num.each do |n|
  puts "this is #{n}"
end

employees = {
  employee1: {
    name: 'Muhammad Umer',
    tittle: 'Ruby on Rail'
  },
  employee2: {
    name: 'Ali',
    job_title: 'Frontend Developer'
  },
  employee3: {
    name: 'Sara',
    job_title: 'UI/UX Designer'
  }
}
employees.each do |emp_id, emp_detail|
  print "\n"
  puts "employee id is #{emp_id}"
  puts "employee name is #{emp_detail[:name]}"
  puts "employee tittle is #{emp_detail[:job_title]}"
end

# break statement
num = 1
loop do
  puts 'hello'
  num += 1
  break if num > 5
end
