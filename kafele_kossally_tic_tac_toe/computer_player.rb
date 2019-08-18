require_relative "board"

class Computer_Player
    attr_accessor :mark, :board

    def initialize
        @mark = nil
    end

    def display(board)
        @board = board
    end

    def get_move
        a = "-" + self.mark.to_s + self.mark.to_s
        b = self.mark.to_s + "-" + self.mark.to_s
        c = self.mark.to_s + self.mark.to_s + "-"
        self.board.axes_hash.each do |key, value|
            if value == a
                row, col = key[0].to_i, key[1].to_i
                return [row, col]
            elsif value == b
                row, col = key[2].to_i, key[3].to_i
                return [row, col]
            elsif value == c
                row, col = key[4].to_i, key[5].to_i
                return [row, col]
            end
        end
        row = [0, 1, 2].sample
        col = [0, 1, 2].sample
        pos = [row, col]
        until board.empty?(pos)
            row = [0, 1, 2].sample
            col = [0, 1, 2].sample
            pos = [row, col]
        end
        return pos
    end

end