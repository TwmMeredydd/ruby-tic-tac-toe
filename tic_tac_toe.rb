# frozen_string_literal: true

require_relative 'game.rb'

x_score = o_score = draw = 0

loop do
  g = Game.new
  x_score += 1 if g.result == 'X'
  o_score += 1 if g == 'O'
  draw += 1 if g == 'D'

  puts 'Would you like to play again? (y to continue)'
  again = gets.chomp
  break if again.downcase != 'y'
end

puts "X scored #{x_score}."
puts "O scored #{o_score}."
puts "There were #{draw} draws."
