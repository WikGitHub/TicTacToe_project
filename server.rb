require './tictactoe'
require 'sinatra'
require 'sinatra/reloader' if development?

game = TicTacToe.new

get '/' do
    erb :layouts do
        erb(:index, locals: {game: game})
    end
end

post '/' do
    # user round - make into one method
    input = game.choose_a_field(params[:field].to_i)
    
    if game.check_if_input_is_1_to_9(input) && game.check_if_field_is_empty(input)
        game.assign_X_or_O_to_a_field(input)
        game.switch_a_player
        # machine round - make into one method
        input_machine = nil
        while game.check_if_input_is_1_to_9(input_machine) != true || game.check_if_field_is_empty(input_machine) != true
            input_machine = game.choose_a_field(rand(1..9))
        end
        game.assign_X_or_O_to_a_field(input_machine)
        game.switch_a_player
        game.winner = game.check_if_any_player_wins
        # if game.winner == nil && game..check_if_any_empty_fields == false
        #     erb(:draw, locals: {game: game})
        # els
        if game.winner != nil
            erb :layouts do
                erb(:winner, locals: {game: game}) 
            end
        else
            erb :layouts do
                erb(:index, locals: {game: game, message: "Field submitted!"})
            end
        end
    else
        erb :layouts do
            erb(:index, locals: {game: game, message: "Wrong input. Please select a number between 1 and 9."})
        end
    end


    

    
end

get '/clear' do
    game.board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    game.winner = nil
    game.current_player = :player1
    erb :layouts do
        erb(:index, locals: {game: game})
    end
end