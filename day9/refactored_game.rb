# creating the number guessing in ruby
def check_game_rules(game_number, user_enter_number)
  flag = 0
  if user_enter_number == game_number
    puts "Number = #{user_enter_number}"
    puts 'Great!!! you guess the right number'
    puts 'Thanks for playing this game'
    flag = 1

  elsif user_enter_number < game_number
    puts 'Nice try!!!!!'
    puts 'But the secret number is greater then your number'
  elsif user_enter_number > game_number
    puts 'Nice try!!!!!'
    puts 'But the secret number is less then your number'
  end
  flag
end

def guessing_game(game_number)
  user_enter_number = 0
  exit_game = 0
  check_flag = 0
  loop do
    puts 'Enter the number = '
    user_enter_number = gets.chomp.to_i
    check_flag = check_game_rules(game_number, user_enter_number)
    break if check_flag == 1

    print 'If you want to exit press 1  '
    exit_game = gets.chomp.to_i

    next unless exit_game == 1

    puts 'Thanks for your time '
    puts 'See you next time'
    break
  end
end
game_number = rand(1..100)
print "\n"
puts '-------Welcome to the number guessing game-------'
guessing_game(game_number)
