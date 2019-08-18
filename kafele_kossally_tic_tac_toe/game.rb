require_relative "human_player"
require_relative "computer_player"

class Game
    attr_accessor :board, :current_player

    def initialize(player_one, player_two)
        @board = Board.new
        @player_one = player_one
        @player_two = player_two
        @player_one.mark = :X
        @player_two.mark = :O
        @current_player = [@player_one, @player_two].sample
    end

    def over?
        if @board.over?
            puts
            board.grid.each { |row| puts row.join('  ')}
            puts
            puts "Game over! #{board.winner} wins!"
            return true
        end
        false
    end

    def switch_players!
        if current_player == @player_one
            @current_player = @player_two
        else
            @current_player = @player_one
        end
    end

    def play_turn
        current_player.display(@board)

        begin
            pos = current_player.get_move
            @board.place_mark(pos, current_player.mark)
        rescue
            retry
        end
        self.switch_players!
    end

    def play
        until self.over?
            self.play_turn
        end
    end

end