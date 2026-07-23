# function to calculate are
def calculate_area(len:, width:)
  len * width
end
area = calculate_area(len: 20, width: 20)
puts "Area is = #{area}"

# function to calculate the tax
def calculate_tax(total_amount, tax_rate)
  total_amount * tax_rate / 100
end
tax = calculate_tax(1000, 8)
puts "total tax apply on your ammount is = #{tax}"

# function for email validations
def email_validation(email)
  email.include?('@') && email.include?('.')
end
puts email_validation('umer@gmail.com')
puts email_validation('umer@gmailcom')

# function for reverse string
def reverse_str(str)
  str.reverse
end
str_test = 'umer'
result = reverse_str(str_test)
puts "Your enter string is #{str_test} and the reverse is #{result}"

# function to check palindrom
def palindrom_check(str)
  str == str.reverse
end
result = palindrom_check(str_test)
result ? puts('string is palindrom') : puts('string is not palindrom')
