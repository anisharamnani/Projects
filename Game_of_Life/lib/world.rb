require_relative 'cell'

puts `clear` # just clears the terminal window so you dont have leftover characters

class World 
	attr_accessor :board
	attr_reader :x, :y
	def initialize (x,y) 
		@board = []
		@x = x 
		@y = y 
	end 

	def populate_random 
		# how do you hard code the board 
		x.times do |i|
			@board << []
			y.times do |j|
				r = rand(1..4)
				r < 3 ? state = "alive" : state = "dead"
				Cell.new(self, i, j, state)
			end 
		end 
	end 


	def tick!
		@board.each do |array|
			array.each do |cell|
				cell.change_state 
				cell.transition_state 
			end 
		end
	end 

	def display
		@board.each do |array|
			array.each do |cell|
				print "\e[?25l" # hides the cursor
				if cell.alive?
					print " * "
				else 
					print " . "
				end 
			end 
			puts
		end 
		sleep(0.2) # sleeps -- makes the program wait a small amount of time so it isn't too fast. you can get rid of this or keep it, whatever you like. won't affect the program itself. just the display. :)
		puts "\e[H" # clears the screen so that it looks like it's animating instead of printing all the way down
	end 
end 


# r = rand(1..5)
# 

