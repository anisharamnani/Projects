require 'debugger'
require 'time'

class Business_Hours 
	attr_accessor :time, :open, :close, :hours 

	def initialize open, close 
		@open = open 
		@close = close 
		@hours = {
							:sun => {},
							:mon => {}, :tue => {}, :wed => {}, 
							:thu => {}, :fri => {}, :sat =>{} 
							}	

	end 

	def update_all
		hours.each_pair {|day, times| times[:open] = @open}
		hours.each_pair {|day, times| times[:close] = @close}
		hours.each_pair {|day, times| times[:opened] = true}
		hours
	end 

	def update_one new_day, new_open, new_close
		hours[new_day.to_sym][:open] = new_open
		hours[new_day.to_sym][:close] = new_close
	end 

	def close day 
		hours[day.to_sym][:opened] = false 
	end 

	def closed?
		closed = []
		hours.each_pair do |day, times|
			closed << day.to_s if times[:opened] == false 
		end
		closed
	end 


	def calculate_deadline deadline, date
		deadline_time = Time.parse(date) + (deadline)
		day = deadline_time.strftime("%a")
		time = deadline_time.strftime("%I:%M") #24 hour
		deadline_time.strftime("%a %b %d %I:%M:%S %Y")
		
	end

	def army_time time
		if time[-2..-1] == "PM" 
			regex = /(.*):/
			new_time = regex.match(time)[1].to_i + 12 
		end 
	end

	def open? day, time 
		open = army_time(hours[day.to_sym][:open])
		close = army_time(hours[day.to_sym][:close])
		week_array = 

		if hours[day.to_sym][:opened] && open < time && close > time 
			return true 
		else 
			hash.keys.index{||}
		end 

	end


end