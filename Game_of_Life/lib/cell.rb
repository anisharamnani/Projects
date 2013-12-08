require_relative 'world'
require 'debugger'

class Cell 
	attr_reader :x, :y
	attr_accessor :state, :world, :cells

	def initialize (world, x=0, y=0, state="dead")
		@x = x 
		@y = y 
		@state = state
		@world = world
		@world.cells << self
	end 

	def alive? 
		return true if self.state == "alive"
	end 

	def live!
		self.state = "alive"
	end 

	def die! 
		self.state = "dead"
	end 


	def find_neighbours
		neighbours = []
		world.cells.each do |cell|
			x_more = self.x + 1 
			x_less = self.x - 1
			y_more = self.y + 1 
			y_less = self.y - 1 

			neighbours << cell if cell.x == x_less && cell.y == y_more #(-1,1)
			neighbours << cell if cell.x == self.x && cell.y == y_more #(0,1)
			neighbours << cell if cell.x == x_more && cell.y == y_more #(1,1)
			neighbours << cell if cell.x == x_less && cell.y == self.y #(-1,0)
			neighbours << cell if cell.x == x_more && cell.y == self.y #(1,0)
			neighbours << cell if cell.x == x_less && cell.y == y_less #(-1,-1)
			neighbours << cell if cell.x == self.x && cell.y == y_less #(0, -1)
			neighbours << cell if cell.x == x_more && cell.y == y_less #(1, -1) 
		end 
		neighbours.compact 
	end 

	def alive_neighbours
		count = 0 
		find_neighbours.each {|neighbour| count += 1 if neighbour.alive?}
		# debugger 
		count 
	end 

	def change_state 
		if alive?
			die! if alive_neighbours < 2 || alive_nieghbours > 3
		else 
			alive! if alive_neighbours == 3
		end 
	end 
end 
