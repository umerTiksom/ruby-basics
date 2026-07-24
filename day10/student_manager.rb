# creating the student management system
def add_student(students)
  print 'Enter the student roll number = '
  roll_no = gets.chomp.to_i
  print 'Enter the student name = '
  name = gets.chomp.to_str
  print 'Enter the student age = '
  age = gets.chomp.to_i

  if students.any? { |_, details| details[:roll_no] == roll_no }
    puts "Student with Roll Number #{roll_no} already exists."
    return
  end

  print 'Enter Grade =  '
  grade = gets.chomp
  key = :"student#{students.length + 1}"
  students[key] = {
    name: name,
    age: age,
    roll_no: roll_no,
    grade: grade
  }
  puts 'Student added successfully.'
end

def delete_student(students)
  print 'Enter the roll number of that record which you want to delete = '
  dlt_roll_no = gets.chomp.to_i
  dlt_key = students.find do |_, details|
    details[:roll_no] == dlt_roll_no
  end
  if students.delete(dlt_key[0])
    puts 'Student Delete successfully'
    print "\n"
  else
    puts 'Student does not found'
  end
end

def update_student(students)
  print 'Enter the roll number for update = '
  update_roll_n = gets.chomp.to_i
  student = students.find do |_, detail|
    detail[:roll_no] == update_roll_n
  end
  if student
    key = student[0]
    print 'Enter the updated roll number = '
    students[key][:roll_no] = gets.chomp.to_i
    print 'Enter the student name = '
    students[key][:name] = gets.chomp.to_str
    print 'Enter the student age = '
    students[key][:age] = gets.chomp.to_i
    print 'Enter the student grade = '
    students[key][:grade] = gets.chomp.to_str
    puts 'Student Update Successfully'
  else
    puts 'Student does not found'
  end
end

def search_student(students)
  print 'Enter the roll number for search = '
  search_roll_no = gets.chomp.to_i

  student = students.find do |_, details|
    details[:roll_no] == search_roll_no
  end
  if student
    puts 'Record Found Successfully'
    print "\n"
    puts "Roll No = #{students[student[0]][:roll_no]}"
    puts "Name = #{students[student[0]][:name]}"
    puts "Age = #{students[student[0]][:age]}"
    puts "Grade = #{students[student[0]][:grade]}"
  else
    puts 'Student not found'
  end
end

def display_list(students)
  puts '----LIST OF THE STUDENTS------'
  print "\n"
  students.each do |key, detail|
    detail.each do |key, value|
      puts "#{key}:  #{value}"
    end
    puts '....................'
  end
end
students = {
  student1: {
    name: 'ali',
    age: 21,
    roll_no: 10,
    grade: 'A-'
  }
}
puts '-----Student Management System------'

loop do
  print "\n"
  puts 'Press 1 to add the student record'
  puts 'Press 2 to delete the student record'
  puts 'Press 3 to update the student record'
  puts 'Press 4 to search the student record'
  puts 'Press 5 to see the list of students'
  puts 'Press 0 to quit the system'
  print "\n"
  print 'Enter the number = '

  button = gets.chomp.to_i
  print "\n"
  case button
  when 0
    puts 'YOU SUCCESSFULY LOGOUT THE SYSTEM'
    exit
  when 1
    add_student(students)
  when 2
    delete_student(students)
  when 3
    update_student(students)
  when 4
    search_student(students)
  when 5
    display_list(students)
  else
    puts 'you enter the wrong number'
    exit
  end
end
