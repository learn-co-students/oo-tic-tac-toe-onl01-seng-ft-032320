class TicTacToe
  
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
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    num = input.to_i 
    index = num - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true 
    else 
      false
    end 
  end 
  
  def turn 
    puts "Player, please choose between 1 and 9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      "That was not a valid move..."
      turn
    end
  end
  
  def turn_count
    @board.count do |position|
      position == ("X") || position == ("O")
    end
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win|
      @board[win[0]] == @board[win[1]] && 
      @board[win[1]] == @board[win[2]] && 
      @board[win[2]] != " "
    end
  end
  
  def full?
    empty = @board.detect do |element|
      element == "" || element == " "
    end
    if empty
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
    if won? || draw?
      true
    end
  end
  
  def winner
    if won? && current_player == "O"
      "X"
    elsif won? && current_player == "X"
      "O"
    end
  end
  
  def play 
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end