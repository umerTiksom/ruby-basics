# if else statement example
 number = 0
 print "Enter the number = "
 number = gets.chomp.to_i
 if number%2 == 0
  puts "number is even"

 else
 puts "number is odd"
 end

# case example
number = 0 
print "emter the number = "
number = gets.chomp.to_i
case
when number==0
  puts "you enter the number 0 "
when number.even?
  puts "number is even"
else
  puts "number is odd"
end