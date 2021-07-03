# class TicTacToe
#
#   WIN_COMBINATIONS = [
#     [0,1,2], # top_row
#     [3,4,5], # middle_row
#     [6,7,8], # bottom_row
#     [0,3,6], # left_column
#     [1,4,7], # center_column
#     [2,5,8], # right_column
#     [0,4,8], # left_diagonal
#     [6,4,2] # right_diagonal
#   ]
#
#   def initialize(board = nil)
#     @board = Array.new(9, " ")
#   end
#
#   def current_player
#     num_turns = turn_count
#     if num_turns % 2 == 0
#       player = "X"
#     else
#       player = "O"
#     end
#     player
#     # turn_count % 2 == 0 ? "X" : "O"
#   end
#
#   def turn_count
#     @board.count{|token| token == "X" || token == "O"}
#   end
#
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
#
#   def input_to_index(input)
#     input.to_i - 1
#   end
#
#   def move(index, token ="X")
#     @board[index] = token
#   end
#
#   def position_taken?(index)
#     @board[index] != " "
#   end
#
#   def valid_move?(index)
#     index.between?(0,8) && !position_taken?(index)
#   end
#
#   def turn
#   puts "Please choose a number 1-9:"
#   user_input = gets.chomp
#   index = input_to_index(user_input)
#   if valid_move?(index)
#     player_token = current_player
#     move(index, player_token)
#     display_board
#     else
#     turn
#     end
#   end
#
#   def won?
#   # WIN_COMBINATIONS.find {|combo| @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "}
#    WIN_COMBINATIONS.each {|combo|
#   # index_0 = win_combo[0]
#   #   # index_1 = win_combo[1]
#   #   # index_2 = win_combo[2]
#   #   #
#   #   #
#   #   # position_1 = @board[index_0]
#   #   # position_2 = @board[index_1]
#   #   # position_3 = @board[index_2]
#
#     if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
#       return combo
#     end
#   }
#   false
# end
#
#   def full?
#     @board.all?{|i| i != " "}
#   end
#
#   def draw?
#   if won?
# 			return false
# 		elsif full? == false
# 			return false
# 		else
# 			return true
# 		end
# end
# def over?
#   if won? || draw? == true
# 			return true
# 		else
# 			return false
# 		end
# end
# def winner
#   winning_combo = won?
# 	 if winning_combo
# 	    return @board[winning_combo[0]]
# 	 end
# end
# def play
#   while over? == false
#     	turn
#     end
#     if draw?
#     	puts "Cat's Game!"
#     elsif winner == "X"
#     	puts "Congratulations X!"
#     elsif winner == "O"
#     	puts "Congratulations O!"
#     end
#   end
# end
class TicTacToe
attr_accessor :board, :number
def initialize
  @board = Array.new(9, " ")
end
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], [0 ,4, 8], [1, 4 ,7], [2, 5, 8], [0, 3, 6], [2, 4, 6]
  ]
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
def input_to_index(input)
    input.to_i - 1
end
def move(index, token = "X")
  @board[index] = token
end
def position_taken?(index)
  @board[index] != " "
end
def valid_move?(index)
  @board[index] == " " && index.between?(0,8)
end
def turn
  puts = "Please enter 1-9"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if
    valid_move?(index)
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end
def won?
  WIN_COMBINATIONS.find {|combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "}
end
def full?
  @board.all? {|spot| spot != " "}
end
def draw?
  if won?
			return false
		elsif full? == false
			return false
		else
			return true
		end
end
def over?
  if won? || draw? == true
			return true
		else
			return false
		end
end
def winner
  winning_combo = won?
	 if winning_combo
	    return @board[winning_combo[0]]
	 end
end
def play
  while over? == false
    	turn
    end
    if draw?
    	puts "Cat's Game!"
    elsif winner == "X"
    	puts "Congratulations X!"
    elsif winner == "O"
    	puts "Congratulations O!"
    end
  end
end
