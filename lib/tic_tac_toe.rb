WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts  "-----------"
puts  " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(user_input) 
  user_input.to_i - 1    
end

def move(board, index, player) 
  board[index]= player
end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end


def current_player(board)
  occupied_pos = turn_count(board)
  
  if occupied_pos % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
  
  puts "Please choose a number 1-9:"
  
  user_input = gets.chomp
  
  index = input_to_index(user_input)
  
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end