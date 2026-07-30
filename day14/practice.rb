# basic short syntax for creating proc
my_proc = proc {
  puts 'Umer'
}
puts 'hello '
my_proc.call
num = [1, 2, 3, 4, 5]
num.each do |n|
  puts n # this is block section and the block is called with the methood
end

puts

puts '------Yield---------'
def fun1
  puts 'hello'
  yield
  puts 'good bye'
end

fun1 do
  puts 'umer'
end

fun1 do
  puts 'Welcome the tiksom system'
end

def display
  puts 'this is demo function'
end
display

fun1 do
  puts 'remaining function'
end

# lamda practice
def test
  l = lambda {
    'Lambda Returned'
  }
  l.call
  'Method End'
end
puts test
lam = lambda { |a, b|
  puts a + b
}
lam.call(5, 5)

puts
puts '----Timer task------'
def timer
  t = Time.now
  puts 'timer start'
  yield if block_given?
  puts 'timer end'
  t2 = Time.now - t
  puts "time taken for this task is #{t2} second"
end
timer do
  sleep(2)
  puts 'task executed....'
end
puts
puts '------Loger-------'
def login
  puts 'login precess start'
  yield if block_given?
  puts 'login Successfully'
end
login do
  puts 'plese wait....'
  sleep(2.5)
end
puts
puts '------Callback-------'
def call_back
  puts 'Saving User......'
  yield if block_given?
  puts 'Welcome to the dashboard'
end
call_back do
  sleep(2.5)
  puts 'User save Successfully'
end
puts
puts '----Banch Mark------'
def banch_mark
  t = Time.now
  puts 'timer start'
  yield if block_given?
  puts 'timer end'
  t2 = Time.now - t
  puts "time taken for this task is #{t2} second"
end
banch_mark do
  sleep(2)
  arr = [1, 6, 8, 4, 2, 0]
  arr.sort.reverse
end
