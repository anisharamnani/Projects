require_relative 'cell'

class World 
	attr_accessor :cells 
	attr_reader :x, :y
	def initialize (x,y)
		@cells = [] 
		@x = x 
		@y = y 
	end 

	def populate 
		# how do you hard code the board 
		x.times do |i|
			y.times do |j|
				Cell.new(self, i, j)
				r = rand(1..5)
				r < 3 ? cell.state = "alive" : state = "dead"
			end 
		end 
	end 


end 


