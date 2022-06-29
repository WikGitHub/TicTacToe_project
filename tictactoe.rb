class TicTacToe
    attr_accessor :board, :player1, :player2, :winner, :players, :current_player

    def initialize()
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
        @winner = nil
        @players = {player1: "X", player2: "O"}
        @current_player = :player1
    end

    def switch_a_player
        if @current_player == :player1
            @current_player = :player2
        elsif @current_player == :player2
            @current_player = :player1
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
        if @current_player == :player1
            # value = "X"
            value = @players[:player1]
        elsif @current_player == :player2
            # value = "O"
            value = @players[:player2]
        end
        self.board[field - 1] = value# if check_if_empty(field)
    end

    # @board[field] = @current_player.value

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

        # # needs to return, otherwise just loops over the whole thing?
        # victory_conditions.each do |conditions|
        #     return true if self.board[conditions[0]] == self.board[conditions[1]] && self.board[conditions[1]] == self.board[conditions[2]]
        # end

        # OR
        victory_conditions.detect do |combination|
            if self.board[combination[0]] == self.board[combination[1]] && self.board[combination[1]] == self.board[combination[2]]
                if self.board[combination[0]] != " "
                    return self.current_player
                end
            end
        end
    end

    def check_empty_fields
        self.board.select {|field| field == " "} == [] ? false : true
    end

    def check_input(input)
        # raise StandardError.new "Invalid input" unless /\d/.match(input.to_s)
        raise StandardError.new "Invalid input" unless input.class == Integer && input <= 9 && input >= 1
        # return "Invalid input" if input.class != Integer || input > 9 || input < 1
    end

    def display_winner
        if self.check_empty_fields == false && self.winner == nil
            "Draw"
        elsif self.check_victory_conditions == :player1
            "Player 1 wins"
        elsif self.check_victory_conditions == :player2
            "Player 2 wins"
        end
    end

end

def run_game(auto = true)
    @new_game = TicTacToe.new
    puts @new_game.display_board
    while @new_game.check_victory_conditions == nil
        puts "#{@new_game.current_player.to_s}'s round"
        # line below changes if player vs player or player vs machine
        puts input = @new_game.choose_a_field(rand(1..9))
        puts @new_game.check_input(input)
        @new_game.assign_a_value(input) if @new_game.check_if_empty(input)
        puts @new_game.display_board
        puts @new_game.winner = @new_game.check_victory_conditions
        @new_game.switch_a_player
    end
    puts @new_game.display_winner


    
    # # initialize the game
    # # while winner is nil then run
        # while input is not valid
        #     # get user input
        #     # check if input is valid
        #     # check if field is empty
    #     # assign value to the field in board
    #     # display the board
    #     # check victory conditions
    #     # if won then assign a winner
    #     # game ends if no empty fields
    # # display the final board
    # # display the winner
end

# class Field
#     attr_accessor :content, :row, :column

#     def initialize(attributes = {})
#         @content = attributes[:content]
#         @row = attributes[:row]
#         @column = attributes[:column]
#     end
# end

# @game = TicTacToe.new

# # displayed_board = ""
# # " 1 | 2 | 3 \n
# #  #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]} \n
# #  #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]} \n
# #  #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]} \n
# #   7 | 8 | 9 \n"
# # displayed_board


# " 1 | 2 | 3 \n   |   |   \n   |   |   \n   |   |   \n 7 | 8 | 9 \n"
# " 1 | 2 | 3 \n   |   |   \n   |   |   \n   |   |   \n  7 | 8 | 9 "

run_game