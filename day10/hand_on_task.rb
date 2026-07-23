# arr1 = []
# arr1.push('ali')
# arr1.each do |n|
#   puts "elements in array = #{n}"
# end
#
# user input
# arr2 = []
# count = 5
# for i in 1..count
#   puts 'enter the number for array = '
#   temp = gets.chomp.to_i
#   arr2 << temp
# end
# count.times do
#   puts 'enter the number for array = '
#   temp = gets.chomp.to_i
#   arr2 << temp
# end
# arr2.each do |n|
#   puts "elements in array = #{n}"
# end
#
# arr = [1, 2, 3, 4, 5, 6]
# arr.pop
# arr.delete(3)
# arr = [4, 2, 6, 9, 1, 3]
# arr = arr.sort.reverse
# arr.each do |n|
#   puts n
# end
# search = arr.include?(1)
# index = arr.index(1)
# search ? puts("your enter number is found and the index is #{index}") : puts('your enter number is not found')

# hashes
cars = {
  name: 'honda city',
  model: 2024,
  color: 'red',
  engine: 1300

}

# access the hash
puts cars[:name]

# update the hash value
cars[:name] = 'honda reborn'
puts cars[:name]

# delete data from the hash
cars.delete(:engine)
puts cars.inspect

# adding new feild in hashs
cars[:seats] = 4
puts 'display after add the new feild'
puts cars.inspect
