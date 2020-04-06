class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
  
  def move(location, token="X")
    square = location
    @index = square
    @board[@index] = token
  end
  
  def position_taken?(index)
    position = index.to_i
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end
  end 
    
  def valid_move?(input)
    num = input
    if num >= 0 && num <= 8
      valid_number = num
        if @board[valid_number] == "X" || @board[valid_number] == "O"
          false
        else
          true
        end
    else
      false
    end
    
  end
    
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    i = 0
    while i < @board.length
      if @board[i] == "X" || @board[i] == "O"
        count += 1
      else
      end
      i += 1
    end
    count
  end
  
  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
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
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combination
      else
      end
    end
    return nil
  end

  def full?
    counter = 0
    @board.each do |element|
      if (element == "X" || element == "O")
        counter += 1
      else
      end
    end
    if counter == 9
      return true
    else
      return false
    end
  end
    
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
    
  def over?
    if (won? || draw? || full?)
      return true
    else
      return false
    end
  end
    
  def winner
    if won?
      WIN_COMBINATIONS.each do |win_combo|
        position_1 = @board[win_combo[0]]
        position_2 = @board[win_combo[1]]
        position_3 = @board[win_combo[2]]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X")
          return "X"
        elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return "O"
        else
        end
      end
    else
      return nil
    end
  end  
    
  def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations " + winner + "!"
  elsif draw?
    puts "Cat's Game!"
  else
  end
end
    
    
    
    
    
    
    
    
    
    
end