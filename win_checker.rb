class WinChecker

  def initialize()

  end

  def has_won?(symbol, board)
    if horizontal_line?(symbol, board) ||
    vertical_line?(symbol, board) ||
    diagonal_line?(symbol, board)
    puts "Congratulations player #{symbol}!  Somehow you mastered this complex game.\n\n"
    self.new_game
    end
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol, board)
    transp_board = board.transpose
    horizontal_line?(symbol, transp_board)
  end

  def diagonal_line?(symbol, board)
    middle_piece = board[1][1]
    return false if middle_piece != symbol
    topleft_bottomright = board[0][0] == symbol && board[2][2] == symbol
    bottomleft_topright = board[2][0] == symbol && board[0][2] == symbol
    topleft_bottomright || bottomleft_topright
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square|
    square == symbol
    end
  end

end