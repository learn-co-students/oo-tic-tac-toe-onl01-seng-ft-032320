class TicTacToe
  
  
  
  
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
  end
  
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # LR diagonal
  [2,4,6]  # RL diagonal

  ]  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(number)
    number.to_i - 1
    
    end
   
   def move(num, token = "X")
     
     # takes in two arguments
      # first argument is the result of the input_to_index
     # need to send it to the board here using position_taken
     @board[num] = token
   end
   
   def position_taken?(number)
     #takes number from move
     @board[number] != " "
     
     
   end
   
   def valid_move?(number)
     @board[number] == " " && number.between?(0,8)
     
   end
   
   def turn
     puts "Please enter 1-9:"
        user = gets.chomp #changing num > number passed test #1 for turn method
      index = input_to_index(user)
        if valid_move?(index)
            player = current_player
            move(index, player)
            #make the move for index
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
     WIN_COMBINATIONS.find {|array| 
      @board[array[0]] == @board[array[1]] &&  @board[array[0]] ==  @board[array[2]] &&  @board[array[0]] != " "}
    end
   
   def full?
    @board.all? {|spots| spots != " "}
    
    end
   
   def draw?
      if won?
        return false
      elsif full? == false
        return false
      else
        return TRUE
      end
   end
   
   
   def over?
     if won? || draw? == true
      return true
    else
      false
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