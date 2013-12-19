require './lib/world'

world = World.new(30,30)
world.populate_random
loop do 
	world.display
	world.tick!
end 