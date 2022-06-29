class TicTacToe
    attr_accessor :board, :player1, :player2, :winner, :players, :current_player

    def initialize()
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
        @player1 = "X"
        @player2 = "O"
        @winner = nil
        @players = ["player1", "player2"]
        @current_player = @players[0]
    end

    def switch_a_player
        if @current_player == @players[0]
            @current_player = @players[1]
        elsif @current_player == @players[1]
            @current_player = @players[0]
        end
    end

    def display_board
        " 1 | 2 | 3 \n #{self.board[0]} | #{self.board[1]} | #{self.board[2]} \n #{self.board[3]} | #{self.board[4]} | #{self.board[5]} \n #{self.board[6]} | #{self.board[7]} | #{self.board[8]} \n 7 | 8 | 9 \n"
    end
    
    def choose_a_field(field = 1)
        # get a row
        # put "Choose a row:"
        # row = gets.chomp
        # get a column
        # [row.to_i, column.to_i]
        field
    end

    def check_if_empty(field)
        self.board[field - 1] == " "
    end

    def assign_a_value(field)
        if @current_player = @players[0]
            value = @player1
        elsif @current_player = @players[1]
            value = @player2
        end
        self.board[field - 1] = value# if check_if_empty(field)
    end

    def check_victory_conditions
        victory_conditions = [  
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [6, 4, 2],
        [2, 5, 8],
        [1, 4, 7],
        [0, 3, 6]
        ]

        # needs to return, otherwise just loops over the whole thing?
        victory_conditions.each do |conditions|
            return true if self.board[contitions[0]] == self.board[contitions[1]] && self.board[contitions[1]] == self.board[contitions[2]]
        end

        # OR
        # #select? I don't think #find would work and also the way it would work it returns the combination rather than true/false
        victory_conditions.find do |combination|
            @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        end
    end

    victory_conditions = [  
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [6, 4, 2],
        [2, 5, 8],
        [1, 4, 7],
        [0, 3, 6]
    ]

    victory_conditions.each do |conditions|
        self.board[contitions[0]] == self.board[contitions[1]] && self.board[contitions[1]] == self.board[contitions[2]]
    end

    self.winner = self.current_player if self.check_victory_conditions

    
    def winning_match
        victory_conditions.find do |combination|
            @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        end
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

@game = TicTacToe.new

# displayed_board = ""
# " 1 | 2 | 3 \n
#  #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]} \n
#  #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]} \n
#  #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]} \n
#   7 | 8 | 9 \n"
# displayed_board


" 1 | 2 | 3 \n   |   |   \n   |   |   \n   |   |   \n 7 | 8 | 9 \n"
" 1 | 2 | 3 \n   |   |   \n   |   |   \n   |   |   \n  7 | 8 | 9 "