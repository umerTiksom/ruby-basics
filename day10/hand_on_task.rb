arr1 = []
arr1.push('ali')
arr1.each do |n|
  puts "elements in array = #{n}"
end

# user input
arr2 = []
count = 5
for i in 1..count
  puts 'enter the number for array = '
  temp = gets.chomp.to_i
  arr2 << temp
end
count.times do
  puts 'enter the number for array = '
  temp = gets.chomp.to_i
  arr2 << temp
end
arr2.each do |n|
  puts "elements in array = #{n}"
end
