# printing number using block
puts
puts '--------Numbers-------'
puts
(1..5).each do |n|
  puts n
end
# code writen inside the do and the end is block
# now inplement the code by creating our own methood
print = proc do |n|
  puts n
end
puts

puts '-------Number display using proc----------'
puts
puts 'numbers are = '
puts
(1..5).each do |num|
  print.call(num)
end
