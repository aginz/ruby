require './bracket.rb'
require './modules.rb'
require './players.rb'
require './round.rb'

include CommonMethods

say("Let's play ping-pong! A simple tournament bracket app created by @ag1nz.")
b = Bracket.new
b.play_tournament
