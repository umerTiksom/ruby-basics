puts 'Enter the name of the user = '
name = gets.chomp
puts 'Enter your phone number = '
phone_number = gets.chomp
phone_number_validator = /\A\d{11}\z/
test = phone_number.match?(phone_number_validator)
puts test
if test
  # writing the text into the file
  File.open('./text.txt', 'a') do |file|
    file.puts name
    file.puts phone_number
    file.close
  end

else
  puts 'your phone number is not valid'
end

# reading the text from the file
data = File.read('./text.txt')
puts 'data store in the file is'
puts '-----------'
puts data
puts '-----------'
