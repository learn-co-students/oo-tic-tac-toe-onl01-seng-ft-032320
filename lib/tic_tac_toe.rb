class TicTacToe
  WIN_COMBINATIONS  =[
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]]

  def initialize
    @board = Array.new(9," ")
  end

  def turn
    puts "please put a number between 1 and 9:"
    answer = input_to_index(gets.chomp)
    
    #binding.pry
    if !valid_move?(answer) 
      #binding.pry 
      turn
    else 
      move(answer, current_player)
      display_board
    end
    
  end
  
  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over? do
      turn
    end

    if won? 
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def move(answer, current_player = "X")
    @board[answer] = current_player
  end 

  def valid_move?(index)
    if (index >= 0 && index <= 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def position_taken?(index)
    #puts "The position you are trying to replace is #{@board[index]}"
    @board[index] == "X" || @board[index] == "O"
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def over?
    if won? || full? ||draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    else 
      nil 
    end 
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |combination|
      characters = combination.map { |combo| @board[combo]}
      win = combination if (characters.all?{|i| i == "X"}) || (characters.all?{|i| i == "O"})
    end
    win
  end

  def full?
    return !@board.any?{|i| i == " "}
  end

  def draw?
    if won? == false && full?
      return true
    else
      return false
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end


