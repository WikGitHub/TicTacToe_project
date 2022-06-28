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








