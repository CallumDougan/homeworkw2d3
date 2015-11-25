require('pry-byebug')
require_relative("game")
require_relative('win_checker')

winchecker = WinChecker.new()
game = Game.new(winchecker)

#placing pieces
game.new_game
game.place_piece(1,1)
game.place_piece(0,2)
game.place_piece(0,0)
game.place_piece(2,1)
game.place_piece(2,2)
game.place_piece(1,2)
# binding.pry;''
# game.flip_board

