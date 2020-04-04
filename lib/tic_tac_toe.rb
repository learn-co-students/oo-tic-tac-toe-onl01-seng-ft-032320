class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], [0,3,6], [0,4,8],
    [1,4,7], [2,4,6], [2,5,8],
    [3,4,5], [6,7,8]
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

    # input = input.to_i
    # input - 1
    #
    # if input == 0
    #   @board[0] = input.to_i
    # elsif input == 1
    #   @board[1] = input.to_i
    # elsif input == 2
    #   @board[2] = input.to_i
    # elsif input == 3
    #   @board[3] = input.to_i
    # elsif input == 4
    #   @board[4] = input.to_i
    # elsif input == 5
    #   @board[5] = input.to_i
    # elsif input == 6
    #   @board[6] = input.to_i
    # elsif input == 7
    #   @board[7] = input.to_i
    # elsif input == 8
    #   @board[8] = input.to_i
    # end
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    @board[index] == " " && index.between?(0,8)
  end

  def turn_count
    @board.count{|player| player != " " }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)

    if valid_move?(index)
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]
    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
    }
  return false
  end

  def full?
    @board.all?{|spot| spot != " "}
  end

  def draw?
    full? && !won?
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
