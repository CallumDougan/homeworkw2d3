require('pry-byebug')
require_relative("game")

game = Game.new()

#placing pieces
game.new_game
game.place_piece(1,1)
game.place_piece(3,3)
game.place_piece(0,0)
game.place_piece(2,1)
game.place_piece(2,2)
game.place_piece(1,2)
# binding.pry;''
# game.flip_board

