require 'stringio'

class TicTacToe
    attr_accessor :board, :player1, :player2, :winner, :players, :current_player

    def initialize()
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
        @winner = nil
        @players = {player1: "X", player2: "O"}
        @current_player = :player1
    end

    def display_current_board
        " 1 | 2 | 3 \n---+---+---\n #{self.board[0]} | #{self.board[1]} | #{self.board[2]} \n---+---+---\n #{self.board[3]} | #{self.board[4]} | #{self.board[5]} \n---+---+---\n #{self.board[6]} | #{self.board[7]} | #{self.board[8]} \n---+---+---\n 7 | 8 | 9 \n"
    end

    def choose_a_field(field = 1)
        field
    end

    def user_choose_a_field
        gets.chomp
    end
    
    def check_if_field_is_empty(field)
        return false if field.class != Integer
        self.board[field - 1] == " "
    end

    def check_if_input_is_1_to_9(input)
        # raise StandardError.new "Invalid input" unless /\d/.match(input.to_s)
        # raise StandardError.new "Invalid input" unless input.class == Integer && input <= 9 && input >= 1
        # return "Invalid input" if input.class != Integer || input > 9 || input < 1
        input.class == Integer && input <= 9 && input >= 1 ? true : false
    end

    def assign_X_or_O_to_a_field(field)
        if @current_player == :player1
            # symbol = "X"
            player_symbol = @players[:player1]
        elsif @current_player == :player2
            # symbol = "O"
            player_symbol = @players[:player2]
        end
        self.board[field - 1] = player_symbol
    end

    def check_if_any_player_wins
        victorious_combinations = [  
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [6, 4, 2],
        [2, 5, 8],
        [1, 4, 7],
        [0, 3, 6]
        ]

        victorious_combinations.detect do |combination|
            if self.board[combination[0]] == self.board[combination[1]] && self.board[combination[1]] == self.board[combination[2]]
                if self.board[combination[0]] != " "
                    return self.players.key(self.board[combination[0]])
                end
            end
        end
    end

    def switch_a_player
        if @current_player == :player1
            @current_player = :player2
        elsif @current_player == :player2
            @current_player = :player1
        end
    end

    def check_if_any_empty_fields
        self.board.select {|field| field == " "} == [] ? false : true
    end

        # self.board.count(" ") == 0 ? false : true

    def display_winner
        if self.check_if_any_empty_fields == false && self.winner == nil
            "Draw"
        elsif self.winner == :player1
            "Player 1 wins"
        elsif self.winner == :player2
            "Player 2 wins"
        end
    end

    def reset
        self.board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
        self.winner = nil
        self.players = {player1: "X", player2: "O"}
        self.current_player = :player1
    end

end

def run_game(auto = true)
    @new_game = TicTacToe.new
    puts "Welcome to Tic Tac Toe!"
    puts @new_game.display_current_board
    while @new_game.check_if_any_player_wins == nil
        puts "#{@new_game.current_player.to_s}'s round"
        input = nil
        while @new_game.check_if_input_is_1_to_9(input) != true || @new_game.check_if_field_is_empty(input) != true
            if @new_game.current_player == :player1 && auto == false
                puts "Select field from 1 to 9"
                input = @new_game.user_choose_a_field
                # a sweet regex
                input = input.to_i if /^\d$/.match(input)
            else
                input = @new_game.choose_a_field(rand(1..9))
            end
            puts @new_game.check_if_input_is_1_to_9(input)
            puts @new_game.check_if_field_is_empty(input)
        end

        @new_game.assign_X_or_O_to_a_field(input)
        puts @new_game.display_current_board
        puts @new_game.winner = @new_game.check_if_any_player_wins
        @new_game.switch_a_player
    end
    puts @new_game.display_winner
end

def check_victory_status_and_render_views(game)
    game.winner = game.check_if_any_player_wins
    # draw
    if game.winner == nil && game.check_if_any_empty_fields == false
        erb :layouts do
            erb(:draw, locals: {game: game})
        end
    # win
    elsif game.winner != nil
        erb :layouts do
            erb(:winner, locals: {game: game}) 
        end
    # made a move, but no win or no draw    
    else
        erb :layouts do
            erb(:index, locals: {game: game, message: "Field submitted!"})
        end
    end
end

def random_computer_turn(game)
    input_machine = nil
    while game.check_if_input_is_1_to_9(input_machine) != true || game.check_if_field_is_empty(input_machine) != true
        input_machine = game.choose_a_field(rand(1..9))
    end
    game.assign_X_or_O_to_a_field(input_machine)
    game.switch_a_player
end