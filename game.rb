class Game

  attr_reader :turn

  def initialize ()
    @board = [
      [nil,nil,nil],
      [nil,nil,nil],
      [nil,nil,nil] 
                    ]
    @pieces = [:o, :x]
    @turn = 0
  end

  def place_piece (row, column)
    if row > 2 || column > 2
      puts "Play on the board, you simpleton."
      return false
    end
    if @board[ row ][ column ] 
      puts "Place occupied, cheater!"
      return false
    end
    @turn += 1
    @board[ row ][ column ] = @pieces[ @turn % 2 ]
    puts "\nTurn ##{self.turn} played.\n\nTurn ##{self.turn+1}, #{@pieces[ @turn % 2 ]}: \n\n"
    puts self.show_board
    puts "\n"
    self.has_won?(@board[ row ][ column ])
    self.draw_check
  end


  def show_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    row_strings.join("\n_ _ _\n")
  end

  def new_game
    @board = [
      [nil,nil,nil],
      [nil,nil,nil],
      [nil,nil,nil]
                    ]
    @turn = 0
    @pieces.reverse!
    puts "New game. #{@pieces[ @turn % 2 ]} to play: \n\n"
    puts self.show_board
  end

  def flip_board
    puts "You flip the table in a rage!\nTry again, loser."
    self.new_game
  end

  def draw_check
    if @turn == 9
      puts "You are both terrible at this."
      self.new_game
    end
  end

  def has_won?(symbol)
    if horizontal_line?(symbol, @board) ||
    vertical_line?(symbol) ||
    diagonal_line?(symbol)
    puts "Congratulations player #{symbol}!  Somehow you mastered this complex game.\n\n"
    self.new_game
    end
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol)
    transp_board = @board.transpose
    horizontal_line?(symbol, transp_board)
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    topleft_bottomright = @board[0][0] == symbol && @board[2][2] == symbol
    bottomleft_topright = @board[2][0] == symbol && @board[0][2] == symbol
    topleft_bottomright || bottomleft_topright
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square|
    square == symbol
    end
  end

  private 

  def row_to_string(row)
    row_sym = row.map do |piece|
    piece || " "
  end
    row_sym.join("|")
  end

end