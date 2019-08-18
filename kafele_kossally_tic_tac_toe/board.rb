class Board
    attr_reader :grid

    def initialize
        @grid ||= Array.new(3) {Array.new(3, '-')}

    end

     def empty?(pos)
        row, col = pos[0], pos[1]
        self.grid[row][col] == '-'
    end

    def place_mark(pos, mark)
        row, col = pos[0], pos[1]
        if self.empty?(pos)
            @grid[row][col] = mark
        else
            raise "invalid position"
        end
    end

    def axes_hash
        axes = Hash.new

        (0..2).each do |row|
            axes["#{row}0#{row}1#{row}2"] = self.grid[row].join
        end

        (0..2).each do |col|
            column = []
            (0..2).each do |row|
                column << self.grid[row][col]
            end
            axes["0#{col}1#{col}2#{col}"] = column.join
        end

        axes["001122"] = [self.grid[0][0], self.grid[1][1], self.grid[2][2]].join
        axes["201102"] = [self.grid[2][0], self.grid[1][1], self.grid[0][2]].join

        axes
    end

    def winner
        self.axes_hash.values.each do |value|
            if value == "XXX" || value == "OOO"
                return value[0]
                
            end
        end
        
        if self.axes_hash.values.none? { |value| value.include? "-"}
            return "No one"
        end
        nil
    end

    def over?
        self.winner != nil
    end

end