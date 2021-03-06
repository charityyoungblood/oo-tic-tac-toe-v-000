class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

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

  def display_board
    horizontal_lines = "-----------"
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts horizontal_lines
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts horizontal_lines
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    (user_input.to_i) - 1
  end
  def move(position, char)
  #place character at index 0 of board array
    @board[position] = char
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
  # is the move between index 0 and 8, 1 - 9 on the player side (i.e. on the game board)
  # silent "is" before your range expression
    (0..8).include?(index) && !position_taken?(index)
  # is the move in a space that has an X or O? if true print false
  end

  def turn_count
# takes in an argument of the board array and
# returns the number of turns that have been played
# board = [9 empty strings]
    @board.count("X") + @board.count("O")
  end

  def current_player
# take in an argument of the game board and use the #turn_count method
# to determine if it is "X"'s turn or "O"'s.
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
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

  def won?
=begin this method should return false/nil if there is no win
 combination present in the board and return the winning
 combination indexes as an array if there is a win
=end
    WIN_COMBINATIONS.detect do |winning_combo|
      winning_combo.all? { |index| @board[index] == "X" } ||
      winning_combo.all? { |index| @board[index] == "O" }
      end
    end

  def full?
# this method should return true if every element/index in the board contains either an "X" or an "O"
# check if every board[index] == "X" or board[index] = "O", return true
# is there an if every method? maybe .each?
    @board.all? do |completed_game|
      completed_game.include?("X") || completed_game.include?("O")
    end
  end

  def draw?
    !won? && full?
  end

  def over?
#returns true if the board has been won, is a draw, or is full
    won? || draw? || full?
  end

  def winner
# return the token, "X" or "O" that has won the game given a winning board.
# if won?(board) && !draw(board)
    if won?
      combo = won? #[0, 1, 2]
      @board[combo[0]]
    end
  end

  def play
=begin
must allow players to take turns, checking if the game is over after every turn,
and at the conclusion of the game, whether because it was won or because
it was a draw, reporting to the user the outcome of the game
- let either X or an O enter input
- check if the game is tied or won after every turn
- let user know the outcome of the game
=end
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
