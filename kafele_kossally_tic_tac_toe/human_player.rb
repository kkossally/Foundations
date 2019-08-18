require_relative "board"

class Human_Player
    attr_accessor :mark

    def initialize
        @mark = nil
    end

    def display(board)
        puts
        puts "#{mark}'s move!"
        puts
        board.grid.each  { |row| puts row.join('  ') }
    end

    def get_move
        puts
        print "Enter coordinates, separated with a space, (e.g.: `4 7`): "
        gets.chomp.split(" ").map(&:to_i)
    end

end