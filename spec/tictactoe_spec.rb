require './tictactoe'

describe 'tic tac toe' do
    before(:each) do
        @game = TicTacToe.new
    end

    context '#initialize' do
        it 'game is initialized with an empty board' do
            expect(@game.board).to eq([' ',' ',' ',' ',' ',' ',' ',' ',' '])
        end

        it 'player 1 uses "X"' do
            expect(@game.player1).to eq("X")
        end

        it 'player 2 uses "O" (O, not zero)' do
            expect(@game.player2).to eq("O")
        end

        it 'there is no winner' do
            expect(@game.winner).to be nil
        end

        it 'initially the first element is empty' do
            expect(@game.board.first).to eq(" ")
        end
    end

    it '#current_player returns the player whose round it is' do
        expect(@game.current_player).to eq("player1")
    end

    it '#check_if_empty checks if field already in use' do
        expect(@game.check_if_empty(1)).to be true
    end

    it '#switch a player switches a player' do
        @game.switch_a_player
        expect(@game.current_player).to eq("player2")
    end

    it 'expect #assign_a_value' do
        @game.assign_a_value(@game.choose_a_field(1))
        expect(@game.board.first).to eq("X")
    end

    it 'expect #assign_a_value not to override existing value' do
        @game.assign_a_value(@game.choose_a_field(1))
        @game.switch_a_player
        @game.assign_a_value(@game.choose_a_field(1))
        expect(@game.board.first).to eq("X")
    end

    context '#choose_a_field' do
        it 'user input present' do
            expect(@game.choose_a_field).not_to be nil
        end

        # # 3x3 grid, rows: 1-3, columns 1-3
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

    context '#display_board' do
        it 'displays an empty board' do
            @game = TicTacToe.new
            expect(@game.display_board).to eq(" 1 | 2 | 3 \n   |   |   \n   |   |   \n   |   |   \n 7 | 8 | 9 \n")
        end
    end

    context "#winner" do
        it 'there is no winner at the beginning' do
            expect(@game.winner).to be nil
        end
    end

    context "#check_victory_conditions" do
        it 'the game is won if 3 symbols in a row' do
            @game.assign_a_value(@game.choose_a_field(1))
            @game.assign_a_value(@game.choose_a_field(2))
            @game.assign_a_value(@game.choose_a_field(3))
            expect(@game.check_victory_conditions).to be(true)
        end
    end
end










