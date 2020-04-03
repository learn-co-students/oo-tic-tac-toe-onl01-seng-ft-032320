class TicTacToe 
  
  WIN_COMBINATIONS = [
      [0, 1, 2], # horizontal winning combinations
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6], # vertical winning combinations
      [1, 4, 7],
      [2, 5, 8],
      [0, 4 ,8],
      [2, 4, 6]
    ]
  
  
  def initialize(board = nil)
    # if board is nil than is false and the new array gets created
    @board = board || Array.new(9, " ")
  end 
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input_to_number = input.to_i 
    index = input_to_number - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if (@board[index] == nil || @board[index] == "" || @board[index] == " ")
      false 
    else
      true
    end 
  end 
  
  def valid_move?(index)
    if(!position_taken?(index) && index.between?(0, 8))
      true 
    else 
      false
    end 
  end 
  
  
  def turn_count
    @board.count { |position|
      position.include?("X") || position.include?("O")
    }
  end 
  
  
  def current_player
    if (turn_count % 2 == 0)
      "X"
    else 
      "O"
    end 
  end 
  
  
  def turn
    puts "Please choose a poistion between 1-9"
    input = gets.strip 
    index = input_to_index(input)
    
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end
    
  def won?
    #find stops iterating when the value is true and returns the true value back
    WIN_COMBINATIONS.find { |position|
      @board[position[0]] == @board[position[1]] && @board[position[1]] == @board[position[2]] && @board[position[2]] != " "
    }
  end

  def full?
    empty_slot = @board.find {|element|  element == "" || element == " "}
    if empty_slot
      false
    else 
      true 
    end 
  end 
  
  def draw?
   if full? && won? == nil
     true
   else 
     false
   end 
  end 
  
  def over?
    if won? != nil || draw? 
      true
    end 
  end
  
  def winner
    if won? 
      if current_player == "O"
        "X"
      elsif current_player == "X"
        "O"
      end 
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
 
















