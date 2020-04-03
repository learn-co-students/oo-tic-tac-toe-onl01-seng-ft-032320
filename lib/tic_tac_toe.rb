class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left to right diagonal
    [2,4,6]  #right to left diagonal
    ]
  
  def initialize
    @board = Array.new(9, " ")
    @won = false
    @winner = nil
    @win_combo = []
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    begin
      return_value = Integer(input, 10) - 1
    rescue ArgumentError
      return_value = -1
    end
    return_value
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " " ? true : false
  end
  
  def valid_move?(index)
    if index > 8 || index < 0
      nil
    elsif position_taken?(index)
      false
    else
      true
    end
  end
  
  def turn
    valid = false
    
    until valid
      puts "Please select 1 - 9"
      input = gets.chomp
      index = input_to_index(input)
      valid = valid_move?(index)
    end
    
    move(index, current_player)
    display_board
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
        @won = true
        @win_combo = combo
        @winner = @board[combo[0]]
      end
    end
    if @won == true
      @win_combo.each
    else
      false
    end
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    won?
    if full? && !@won
      true
    elsif @won
      false
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    else
      false
    end
  end
  
  def winner
    won?
    @winner
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end