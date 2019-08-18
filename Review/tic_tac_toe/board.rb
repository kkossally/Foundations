class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) { Array.new(3) }
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end
    
    def []=(pos, mark)
       row, col = pos
       grid[row][col] =  mark
    end

    def empty?(pos)
        self[pos].nil?
    end

    def place_mark(pos, mark)
        raise "That position is already taken!" if !self.empty?(pos)
        self[pos] = mark
    end

    def winner
        cols = Array.new(3)
        cols[0] = [grid[0][0], grid[1][0], grid[2][0]]
        cols[1] = [grid[0][1], grid[1][1], grid[2][1]]
        cols[2] = [grid[0][2], grid[1][2], grid[2][2]]

        diagonals = [ [ grid[0][0], grid[1][1], grid[2][2] ], [ grid[2][0], grid[1][1], grid[0][2] ] ]

        (grid + cols + diagonals).each do |seq|
            return :X if seq.all? { |mark| mark == :X }
            return :O if seq.all? { |mark| mark == :O }
        end

        nil
    end

    def over?
        grid.flatten.none? { |pos| pos == nil } || self.winner
    end

end

# board = Board.new
# p board.grid

# board.place_mark([0, 0], :O)
# board.place_mark([0, 1], :O)
# board.place_mark([0, 2], :X)
# board.place_mark([1, 0], :X)
# board.place_mark([1, 1], :X)
# board.place_mark([1, 2], :O)
# board.place_mark([2, 0], :O)
# board.place_mark([2, 1], :O)
# board.place_mark([2, 2], :X)
# p board.grid

# p board.winner

# p board.over?