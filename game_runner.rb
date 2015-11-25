require('pry-byebug')
require_relative("game")
require_relative('win_checker')
require_relative('AI')

winchecker = WinChecker.new()
game = Game.new(winchecker)

#placing pieces
game.start
# binding.pry;''
# game.flip_board

