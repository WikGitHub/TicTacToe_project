require './tictactoe'
require 'stringio'

describe 'tic tac toe' do
    before(:each) do
        @game = TicTacToe.new
    end

    context '#initialize' do
        it 'game is initialized with an empty board' do
            expect(@game.board).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
        end

        it 'player 1 uses "X"' do
            expect(@game.players[:player1]).to eq("X")
        end

        it 'player 2 uses "O" (O, not zero)' do
            expect(@game.players[:player2]).to eq("O")
        end

        it 'there is no winner' do
            expect(@game.winner).to be nil
        end

        it 'initially the first element is empty' do
            expect(@game.board.first).to eq(" ")
        end

        it '#current_player returns the player whose round it is' do
            expect(@game.current_player).to eq(:player1)
        end

        it 'there is no winner at the beginning' do
            expect(@game.winner).to be nil
        end
    end

    context '#display_current_board' do
        it 'displays an empty board' do
            @game = TicTacToe.new
            expect(@game.display_current_board).to eq(" 1 | 2 | 3 \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n---+---+---\n 7 | 8 | 9 \n")
        end
    end

    context '#choose_a_field' do
        it 'user input present' do
            expect(@game.choose_a_field).not_to be nil
        end

        it 'returns an array' do
            expect(@game.choose_a_field).to be_a_kind_of(Integer)
        end

        context 'input is between 1-9' do
            it 'input is less or equal 9' do
                expect(@game.choose_a_field(3)).to be <= 9
            end
            it 'input is 1 or more' do
                expect(@game.choose_a_field(1)).to be >= 1
            end
        end
    end

    context '#user_choose_a_field' do
        $stdin = StringIO.new("2")

        it "returns user's value" do
            expect(@game.user_choose_a_field).to eq("2")
        end
    end

    context "#check_if_field_is_empty" do
        it '#check_if_field_is_empty checks if field already in use' do
            expect(@game.check_if_field_is_empty(1)).to be true
        end
    end

    context '#check_if_input_is_1_to_9' do
        # xit "doesn't raise error when valid input" do
        #     expect{@game.check_if_input_is_1_to_9(1)}.not_to raise_error("Invalid input")
        # end

        # it "raises error when invalid input" do
        #     expect{@game.check_if_input_is_1_to_9(10)}.to raise_error("Invalid input")
        # end

        it "returns false when invalid input" do
            expect(@game.check_if_input_is_1_to_9(10)).to be false
        end
    end

    context '#assign_X_or_O_to_a_field' do
        it 'when assigned "X" returns "X' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1))
            expect(@game.board.first).to eq("X")
        end

        it 'expect #assign_X_or_O_to_a_field not to override existing value' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1))
            @game.switch_a_player
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1)) if @game.check_if_field_is_empty(1)
            expect(@game.board.first).to eq("X")
        end
    end

    context "#check_if_any_player_wins" do
        it 'the game is won if 3 symbols in a row' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(2))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(3))
            expect(@game.check_if_any_player_wins).to eq(:player1)
        end

        it 'the game is won if 3 symbols in a column' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(4))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(7))
            expect(@game.check_if_any_player_wins).to eq(:player1)
        end

        it 'the game is won if 3 symbols diagonally from the left' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(1))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(5))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(9))
            expect(@game.check_if_any_player_wins).to eq(:player1)
        end

        it 'the game is won if 3 symbols diagonally from the right' do
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(3))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(5))
            @game.assign_X_or_O_to_a_field(@game.choose_a_field(7))
            expect(@game.check_if_any_player_wins).to eq(:player1)
        end
    end

    context '#switch_a_player' do
        it 'switches a player' do
            @game.switch_a_player
            expect(@game.current_player).to eq(:player2)
        end
    end

    context '#check_if_any_empty_fields' do
        it 'returns true when there are empty fields' do
            expect(@game.check_if_any_empty_fields).to be true
        end

        it 'returns true when there are empty fields' do
            @game.board = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
            expect(@game.check_if_any_empty_fields).to be false
        end
    end

    context '#display_winner' do
        it 'displays draw when all fields used & no winner' do
            @game.board = ["X", "O", "X", "O", "X", "O", "X", "O", "X"] 
            expect(@game.display_winner).to eq("Draw")
        end

        it 'displays player 1 if matches for Xs' do
            @game.board = ["X", "X", "X", "O", "O", " ", " ", " ", " "] 
            @game.winner = @game.check_if_any_player_wins
            expect(@game.display_winner).to eq("Player 1 wins")
        end
        
        it 'displays player 2 if matches for Os' do
            @game.switch_a_player
            @game.board = ["O", "O", "O", "X", "X", " ", " ", " ", " "] 
            @game.winner = @game.check_if_any_player_wins
            expect(@game.display_winner).to eq("Player 2 wins")
        end
    end

    context '#run_game' do
        before(:each) do
            run_game
        end
        it 'initializes a game' do
            expect(@new_game).not_to be nil
        end
    end

end










