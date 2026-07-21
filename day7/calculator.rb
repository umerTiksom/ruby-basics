num1 = 0.0
num2 = 0.0
result = 0.0
button_press = 0
flag = 0
print "-------Welcome to the Calculator-------- \n"
print "Enter the first Number = "
num1 = gets.chomp.to_f
print "\n"
print "Enter thhe second Number = "
num2 = gets.chomp.to_f

puts 'Press 1 for addition'
puts 'Press 2 for subtraction'
puts 'Press 3 for multiply'
puts 'Press 4 for division'
button_press = gets.chomp.to_i
if button_press == 1
  result = num1 + num2
elsif button_press == 2
  result = num1 - num2
elsif button_press == 3
  result = num1 * num2
elsif button_press == 4
  result = num1 / num2
else
  puts "You enter the wrong input"
  flag = 1
end
if flag == 0 
  puts "Result of your operation is = #{result}"
end
