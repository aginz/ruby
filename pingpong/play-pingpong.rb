require './bracket.rb'
require './modules.rb'
require './players.rb'
require './round.rb'

include CommonMethods

b = Bracket.new
b.play_tournament
