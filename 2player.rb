class GameBoard
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]            # Diagonals
  ]

  def initialize
    @board = (1..9).to_a
    @current_player = 'X'
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def check_winner(symbol)
    WINNING_COMBINATIONS.any? { |comb| comb.all? { |pos| @board[pos] == symbol } }
  end

  def make_move(position)
    if @board[position - 1] != 'X' && @board[position - 1] != 'O'
      @board[position - 1] = @current_player
      display_board
      if check_winner(@current_player)
        puts "Player #{@current_player} wins!"
      elsif @board.all? { |pos| pos == 'X' || pos == 'O' }
        puts "It's a draw!"
      else
        @current_player = (@current_player == 'X' ? 'O' : 'X')
        puts "Next turn: Player #{@current_player}"
      end
    else
      puts "Invalid move. Please try again."
    end
  end

  def start_game
    until check_winner('X') || check_winner('O') || @board.all? { |pos| pos == 'X' || pos == 'O' }
      display_board
      puts "Player #{@current_player}, enter your move (1-9): "
      position = gets.chomp.to_i
      make_move(position)
    end

    if check_winner('X')
      puts "Player X wins!"
    elsif check_winner('O')
      puts "Player O wins!"
    else
      puts "It's a draw!"
    end
  end
end

# Create a new game instance and start the game
game = GameBoard.new
game.start_game
