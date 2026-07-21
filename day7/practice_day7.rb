# strings
name = "umer"
puts name
puts name.length
puts name.upcase
#used for the lowerCase
puts name.downcase
puts name.reverse
puts name.object_id
testing_task = "Hi my name is umer and I am from tiksom"
puts testing_task.include?("umer")
# replace the old text with the new text
puts testing_task.gsub("umer", "Umer Iqbal")

#symbols
person ={
  name:"Ali",
  age: 24
}
puts person[:name] #use :name to access the symbols

#arrays

arr1=[1,2,3,4,5]
puts arr1[3]
arr2 = [1,2,"ali",2.34]
puts arr2[2]
arr1.push(6)
arr1.each do |num|
puts num
end

#hash (data structure)
employee = {
  name: "Ali",
  salary: 22500
}
puts "salary of the #{employee[:name]} is #{employee[:salary]}"
number =40
puts number.even?
testing_task = "Hi my name is umer and I am from tiksom"
puts testing_task.match?(/access/)