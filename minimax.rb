class TicTacToe
    def minimax_algorithm(board, depth, player)
        if player == player2
            # why is it -1 in both?
            best = [-1, - Float::INFINITY]
        else
            best = [-1, Float::INFINITY]
        end
   
        if depth.zero? || game_over(board)
            # looks like this is not right?
            score = evaluate board
            return [-1, score]
        end
       
        register_empty_cells(board) do |cell|
            board[cell] = player
            score = minimax_algorithm board, depth - 1, -player
            state[cell] = 0
            score[0] = cell # not sure abt this line
           
            if player == player2
                if score[1] > best[1]
                    best = score
                end
            else
                if score[1] < best[1]
                    best = score
                end
            end
        end
       
        best
    end
  
    # added func: creates array of empty cell positions
    def register_empty_cells(board)
        cells = []
        board.each do |cell|
            this_cell = board[cell]
            if this_cell == " "
                cells << cell
            end
        end  
    end
  
    # added func
    def computer_turn
        depth = empty_cells(board)
        return if depth.zero? || game_over(@board)
   
        if depth == 9
            cell = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
        else
            move = minimax_algorithm @board, depth, player2
            cell = move
        end
   
        assign_X_or_O_to_a_field cell
    end
  
    #  only calculates number of empty cells
    def empty_cells(board)
        count = 0
        for cell in board do
            cell == ' '
            count += 1
        end
        count
    end
 
end