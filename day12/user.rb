# user class task
class User
  attr_accessor :username, :password

  @@login_count = 0
  @username
  @password

  # login function
  def login
    @@login_count += 1
    puts "login successfully \n Welcome #{@username}"
  end

  def self.login_count
    puts "#{@@login_count} time login button hits"
  end
end
puts 'enter the username = '
name = gets.chomp
puts 'enter the password'
pass = gets.chomp
u1 = User.new
u1.username = name
u1.password = pass
u1.login
u2 = User.new
u2.username = 'Ali'
u2.password = '123'
u2.login
u1.login
User.login_count
