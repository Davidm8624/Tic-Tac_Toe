class GameBoard
  def initialize
    @board = (1..9).to_a
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def update_board(position, symbol)
    @board[position - 1] = symbol
  end

  def position_available?(position)
    @board[position - 1] != 'X' && @board[position - 1] != 'O'
  end

  def is_draw?
    @board.all? {|position| position =='X' || position == 'O'}
  end

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]            # Diagonals
  ]

  def check_winner(symbol)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |position| @board[position] == symbol }
    end
  end

  def make_move(position, symbol)
    if position_available?(position)
      update_board(position, symbol)
      display_board
      if check_winner(symbol)
        puts "Player #{symbol} wins!"
        # Handle win condition
      elsif is_draw?
        puts "It's a draw!"
        # Handle draw condition
      else
        switch_turn(symbol)
      end
    else
      puts "Invalid move. Please try again."
    end
  end

  private

  def switch_turn(symbol)
    @current_player = (symbol == 'X' ? 'O' : 'X')
    puts "Next turn: Player #{@current_player}"
  end

  public
end

