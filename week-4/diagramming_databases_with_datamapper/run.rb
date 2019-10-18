require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, 'postgres://localhost/diagramming_databases')

require './lib/player'
require './lib/game'

DataMapper.finalize
DataMapper.auto_upgrade!

game = Game.first
game ||= Game.start("Jeffrey", "Lydia")
game.play_point
