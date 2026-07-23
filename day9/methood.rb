def displayName
  puts 'hello world'
end
displayName

def displayWithPrams(name:, age:)
  puts "Name is #{name} and the age is #{age}"
end

displayWithPrams(name: 'umer', age: 24)
arr1 = [1, 2, 3, 4]
puts arr1.inspect

# checking the palindrom
def palindrom(str)
  str == str.reverse ? puts('the word is palindrom') : puts('the word is not palindrom')
end
palindrom('egd')

# map function
result = arr1.map do |num|
  num * 2
end
puts result
puts result.inspect # ya puri change array show krwy ga
# puts arr1

# select methood filter krta ha data
arr2 = [1, 22, 3, 4, 5, 66, 7]
result2 = arr2.select do |n|
  n.even?
end
puts result2
# inject methood
result3 = arr2.inject do |total, n|
  total + n
end
puts "Sum of the arr2 is #{result3}"

# yield methood
def yeildFunction
  puts 'hello'
  yield if block_given?
  puts 'Good BYE'
end
yeildFunction do
  puts 'Welcome to the tiksom'
end

# proc object

demo = proc do |a, b|
  puts "result of a*b is = #{a * b}"
end
demo.call(2, 3)

# lamda
square = ->(num) { num * num }

puts "square of the lamda methood is = #{square.call(4)}"
