class TicTacToe
    attr_accessor :board, :player1, :player2, :winner

    def initialize()
        @board = []
        @player1 = "X"
        @player2 = "O"
        @winner = nil
    end

    def display_board(cells)
        cells
    end
    
    def choose_a_field(row = 1, column = 1)
        # get a row
        # put "Choose a row:"
        # row = gets.chomp
        # get a column
        # [row.to_i, column.to_i]
        [row, column]
    end

    def check_win_status
        @winner
    end
end

class Field
    attr_accessor :content, :row, :column

    def initialize(attributes = {})
        @content = attributes[:content]
        @row = attributes[:row]
        @column = attributes[:column]
    end
end
