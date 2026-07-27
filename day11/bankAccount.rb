class Bank_account
  attr_accessor :name, :age, :balance
  def initialize (name,age,balance)  
    if name == ""|| name == nil
      raise" Please enter the name"
    else
      @name =name
      @age = age
      @balance = balance
    end  
  end
  def display()
    puts "name = #{@name}"
    puts "age = #{@age}"
    puts "balance = #{@balance}"
  end
end
person1 = Bank_account.new("umer",25,5000)
person1.display
person2 = Bank_account.new("",29,20000)
person2.display