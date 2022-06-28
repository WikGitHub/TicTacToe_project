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
    
    def choose_a_field
        # get a row
        # put "Choose a row:"
        # row = gets.chomp
        # get a column
        # [row.to_i, column.to_i]
        [1, 1]
    end
end
