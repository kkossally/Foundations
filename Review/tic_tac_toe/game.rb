require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

    attr_accessor :board, :current_player
    attr_reader :player_one, :player_two

    def initialize(mark1, mark2)
        @board = Board.new
        @player_one = Human_Player.new(mark1)
        @player_two = Computer_Player.new(mark2)
        @current_player = (player_one.mark == :X ? player_one : player_two)
    end

    def switch_players!
        current_player = current_player == player_one ? player_two : player_one
    end
    
    def play_turn
        board.place_mark(current_player.get_move, current_player.mark)
        switch_players!
        current_player.display(board)
    end

    def play
        current_player.display(board)
        
        until board.over?
            play_turn
        end

        puts "Game over! #{board.winner || "no one"} wins!"
    end

end

puts "Let's play Tic Tac Toe!"
puts
print "Would you like to be X or O?: "
mark_one = (gets.chomp.to_s.upcase == 'X' ? :X : :O)
mark_two = (mark_one == :X ? :O : :X)

game = Game.new(mark_one, mark_two)
game.play