require './tictactoe'

describe 'viewing the empty tic tac toe grid' do
    # it 'remains empty' do
    #     grid = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    #     expect(display_board(grid)).to eq(grid)
    # end
end

describe '#choose_a_field' do
    before(:each) do
        @game = TicTacToe.new
    end

    it 'user input present' do
        expect(@game.choose_a_field).not_to be_empty
    end

    # # 3x3 grid, rows: 1-3, columns 1-3
    it 'returns an array' do
        expect(@game.choose_a_field).to be_a_kind_of(Array)
    end

    it 'returns an array with two elements [row, column]' do
        expect(@game.choose_a_field.size).to eq(2)
    end

    it 'row input is an integer' do
        expect(@game.choose_a_field.first).to be_a_kind_of(Integer)
    end

    it 'column input is an integer' do
        expect(@game.choose_a_field.last).to be_a_kind_of(Integer)
    end

    context 'row input is between 1-3' do
        it 'row input is less or equal 3' do
            expect(@game.choose_a_field(3).first).to be <= 3
        end
        it 'row input is 1 or more' do
            expect(@game.choose_a_field(1).first).to be >= 1
        end
    end

    context 'column input is between 1-3' do
        it 'column input is less or equal 3' do
            expect(@game.choose_a_field(3).last).to be <= 3
        end
        it 'column input is 1 or more' do
            expect(@game.choose_a_field(1).last).to be >= 1
        end
    end
end

describe 'tic tac toe' do
    before(:each) do
        @game = TicTacToe.new
    end

    it 'game is initialized with an empty board' do
        expect(@game.board).to be_empty
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
end

describe "#check_win_status" do
    before(:each) do
        @game = TicTacToe.new
    end

    it 'there is no winner at the beginning' do
        expect(@game.check_win_status).to be nil
    end

    # it 'there is no winner after round 1' do
    # end
end

describe 'field' do #State
    context 'has a content' do
        it 'has an empty content' do
            expect(Field.new(content: nil).content).to be nil
        end

        it 'has a content of "X"' do
            expect(Field.new(content: "X").content).to eq("X")
        end

        it 'has a content of "O"' do
            expect(Field.new(content: "O").content).to eq("O")
        end
    end

    context 'it has a position' do
        it 'row value is not nil' do
            expect(Field.new(row: 1).row).not_to be nil
        end

        it 'column value is not nil' do
            expect(Field.new(column: 1).column).not_to be nil
        end

        it 'row value is less or equal 3' do
            expect(Field.new(row: 1).row).to be <= 3
        end

        it 'row value is more or equal 1' do
            expect(Field.new(row: 1).row).to be >= 1
        end

        it 'column value is less or equal 3' do
            expect(Field.new(column: 1).column).to be <= 3
        end

        it 'column value is more or equal 1' do
            expect(Field.new(column: 1).column).to be >= 1
        end
    end
end









