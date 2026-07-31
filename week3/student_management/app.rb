require 'colorize'
require 'faker'
require_relative './lib/school'
puts 'app start'
school = School.new
school.start
