class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]# Middle row
  # et cetera, creating a nested array for each win combination
]
  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end
  
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
  
  def move(index, current_player="X")
    @board[index] = current_player
  end
  
  def valid_move?(inputs)
    if inputs.between?(0,8) && position_taken?(inputs) == false
      return true
    else 
    false
    end
  end

  def position_taken?(inputs)
    if @board[inputs] != " " && @board[inputs] != "" 
    true
    else
    false
    end
  end
  
  def turn
  puts "Please enter 1-9:"
  user_input = gets.chomp
  mark = input_to_index(user_input)
  if valid_move?(mark) == true
    player = current_player
    move(mark, player)
    display_board
  else
    puts "Invalid Entry"
    turn
  end
  
end
  
  def turn_count
  counter = 0
  @board.each do |spots|
  if spots == "X" || spots == "O"
    counter += 1
  end
  end
  counter
  end
  
  def current_player
  if turn_count % 2 == 0 
    "X"
  else
    "O"
  end
end
  
 def won?
 
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination 
  else
    false
  end
end
false
end
  
 def full?
  @board.all? do |mark| mark == "X" || mark == "O"
  end
end
  
  def draw?
  if full? && !(won?)
    return true
  else 
    return false
  end
end

def over?
  if full? || won? || draw?
    return true
  else
    return false
  end
end

  
def winner
 if game = won?
  @board[game.first]
else
end
end
  
def play
  
  until over? == true
   turn
  end
  if won?
   puts "Congratulations #{winner}!"
  elsif draw? 
   puts "Cat's Game!"
 end
end
end