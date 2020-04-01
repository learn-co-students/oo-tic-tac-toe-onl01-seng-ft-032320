class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

  def move (index,token = "X")
    if @board[index] != (nil || "")
      @board[index] = token
    end
  end

  def position_taken? (index)
    if (@board[index] == "X") || (@board[index] == "O")
      true
    else
      false
    end
  end

  def valid_move? (index)
    if position_taken?(index)
      false
    elsif !position_taken?(index) && (index >= 0 && index < 9)
      true
    end
  end

  def turn_count
    count = 0
    @board.select do |token|
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      turn_count
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |item|
      item == "X" || item == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      "#{@board[won?[0]]}"
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
