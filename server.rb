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

        check_victory_status_and_render_views(game)

        if game.check_if_any_empty_fields == true
            random_computer_turn(game)
            check_victory_status_and_render_views(game)
        else
            # draw
            erb :layouts do
                erb(:draw, locals: {game: game})
            end
        end

    else
        erb :layouts do
            erb(:index, locals: {game: game, message: "Wrong input. Please select an empty field between 1 and 9."})
        end

    end

end

get '/clear' do
    game.board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    game.winner = nil
    game.current_player = :player1
    redirect '/'
end
