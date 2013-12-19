require_relative 'cell'
require_relative 'world'

class Display 
	attr_accessor :world  
	
	def initialize 
		@world = World.new(10,10)
	end 

	def display 
		@board.x.times do |x|
			x.each do |cell|
				if cell.alive?
					print " * "
				else 
					print " . "
				end 
			end 
		end 
		puts 
	end 

end  

