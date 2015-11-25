require_relative ("win_checker")

class Game

  attr_reader :turn

  def initialize (winchecker)
    @board = [
      [nil,nil,nil],
      [nil,nil,nil],
      [nil,nil,nil] 
                    ]
    @pieces = [:o, :x]
    @turn = 0
    @winchecker = winchecker
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
    @board[ row ][ column ] = @pieces[ @turn % 2 ]
    current_piece = @pieces[ @turn % 2 ]
    puts "\nTurn ##{self.turn} played.\n\nTurn ##{self.turn+1}, #{@pieces[ @turn % 2 ]}: \n\n"
    puts self.show_board
    puts "\n"
    @winchecker.has_won?(current_piece, @board)
    self.draw_check
    @turn += 1
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

  private 

  def row_to_string(row)
    row_sym = row.map do |piece|
    piece || " "
  end
    row_sym.join("|")
  end



end