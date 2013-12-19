require_relative 'cell'

class World 
	attr_accessor :cells 
	attr_reader :x, :y
	def initialize (x,y)
		@cells = [] 
		@board = []
		@x = x 
		@y = y 
	end 

	def populate_random 
		# how do you hard code the board 
		x.times do |i|
			@board << []
			y.times do |j|
				r < 3 ? state = "alive" : state = "dead"
				@board[i] << Cell.new(self, i, j, state)
			end 
		end 
	end 

	
end 


# r = rand(1..5)
# 

