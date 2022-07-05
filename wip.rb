# puts "Write a number"
# number = gets.chomp
# print "Your number is:"
# print number
require './tictactoe'
# require 'sinatra'

game = TicTacToe.new

game.board = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]

def check_victory(game)
    game.winner = game.check_if_any_player_wins
    # draw
    if game.winner == nil && game.check_if_any_empty_fields == false
        puts "It's a draw"
    # win
    elsif game.winner != nil
        puts "there is a winner #{game.winner}"
    # made a move, but no win or no draw    
    else
        puts "Field submitted"
    end
end

check_victory(game)




