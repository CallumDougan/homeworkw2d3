require('pry-byebug')
require_relative("game")
require_relative('win_checker')

winchecker = WinChecker.new()
game = Game.new(winchecker)

#placing pieces
game.new_game
# binding.pry;''
# game.flip_board

