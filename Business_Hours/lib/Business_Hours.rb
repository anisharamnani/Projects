require 'debugger'

class Business_Hours 
	attr_accessor :time, :open, :close, :hours 

	def initialize open, close 
		@open = open 
		@close = close 
		@hours = {
							:sun => {},
							:mon => {}, :tue => {}, :wed => {}, 
							:thurs => {}, :fri => {}, :sat =>{}
							}	

	end 

	#write a method that makes string values into days 
	def date_to_day 
	end 

	def update_all
		hours.each_pair {|day, times| times[:open] = @open}
		hours.each_pair {|day, times| times[:close] = @close}
		hours
	end 

	# change the opening and closing time for a given day  
	def update_one new_day, new_open, new_close
		@hours.each_pair do |day, times|
			if day == new_day 
				times[:open] = new_open 
				times[:close] = new_close 
			end
		end 
		hours
	end 


	def closed 
		
	end 

	def calculate_deadline time_interval, day
	end 

end