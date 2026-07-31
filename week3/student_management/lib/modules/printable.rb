require 'colorize'
module Printable
  def print_heading(title)
    puts
    puts '-' * 30
    puts title.upcase.blue
    puts '-' * 30
  end

  def success(message)
    puts "✔ #{message}".green
  end

  def error(message)
    puts "✘ #{message}".red
  end

  def info(message)
    puts "➜ #{message}".yellow
  end
end
