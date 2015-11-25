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

  def user_input
    puts "Please enter your play in the format ROW,COLUMN e.g. 2,1"
    played = gets.chomp.split(",")
    row = played[0].to_i
    column = played[1].to_i
    place_piece(row, column)
  end

  def place_piece (row, column)
    if !sense_checker(row, column)    
    return
    end
    @board[ row ][ column ] = @pieces[ @turn % 2 ]
    puts "\nTurn ##{self.turn} played.\n\nTurn ##{self.turn+1}, #{@pieces[ @turn % 2 ]} to play.  Here is the board: \n\n"
    puts self.show_board
    puts "\n"
    check_for_result
    @turn += 1
    user_input
  end

  def sense_checker (row, column)
    if row > 2 || column > 2
      puts "Play on the board, you simpleton."
      return false
    end
    if @board[ row ][ column ] 
      puts "Place occupied, cheater!"
      return false
    end
    true
  end

  def check_for_result
    if @winchecker.has_won?(@pieces[ @turn % 2 ], @board)
    puts "Congratulations player #{@pieces[ @turn % 2 ]}!  Somehow you mastered this complex game.\n\n"
    new_game
    elsif @turn == 9
    puts "You are both terrible at this."
    new_game
    end
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
    user_input
  end

  def flip_board
    puts "You flip the table in a rage!\nTry again, loser."
    new_game
  end

  def draw_check
   @turn == 9
  end

  private 

  def row_to_string(row)
    row_sym = row.map do |piece|
    piece || " "
  end
    row_sym.join("|")
  end



end