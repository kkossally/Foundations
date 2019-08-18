class Computer_Player

    attr_reader :board, :mark

    def initialize(mark)
        @mark = mark
    end

    def display(board)
        @board = board
    end

    def get_move
        moves = []
        (0..2).each do |row|
            (0..2).each do |col|
                pos = [row, col]
                moves << pos if board.empty?(pos)
            end
        end

        moves.each do |move|
            return move if wins?(move)
        end

        moves.each do |move|
            return move if blocks?(move)
        end

        moves.sample
    end
    
    def wins?(move)
        board[move] = mark

        if board.winner == mark
            board[move] = nil
            return true
        else
            board[move] = nil
            return false
        end
    end

    def blocks?(move)
        opp_mark = (mark == :X ? :O : :X)
        board[move] = opp_mark

        if board.winner == opp_mark
            board[move] = nil
            return true
        else
            board[move] = nil
            return false
        end
    end

end