demo_string = 'Welcome to the Tiksom Limited'
puts demo_string.match?(/the/)
puts demo_string.match?(/[\Ati|om\z]i/)

phone = '03249045679'
puts 'Phone Match'
puts phone.match?(/\A\d{11}\z/)
cnic = '35203-5509102-1'
puts 'CNIC match'
puts cnic.match?(/\A\d{5}-\d{7}-\d{1}\z/)

password = 'tik@1234'
puts 'Password match'
puts password.match?(/\A(?=.*[a-z])(?=.*[A-z])(?=.*\d).{8}\z/)
