require_relative "game"

puts "Let's play Tic Tac Toe!"
puts
print "Is player one a human or a computer?: "

player_type = gets.chomp.downcase

player_one = Computer_Player.new if player_type.include?("c")
player_one = Human_Player.new if player_type.include?("h")

puts
print "Is player two a human or a computer?: "

player_type = gets.chomp.downcase

player_two = Computer_Player.new if player_type.include?("c")
player_two = Human_Player.new if player_type.include?("h")
        

game = Game.new(player_one, player_two)

game.play