# creating the student management system
def add_student
end

def delete_student
end

def update_student
end

def search_student
end

def display_list
end

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
  students = {}
  case button
  when 0
    puts 'YOU SUCCESSFULY LOGOUT THE SYSTEM'
    exit
  when 1
    add_student
  when 2
    delete_student
  when 3
    update_student
  when 4
    search_student
  when 5
    display_list
  else
    puts 'you enter the wrong number'
    exit
  end
end
