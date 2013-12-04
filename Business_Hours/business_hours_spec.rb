require './lib/Business_Hours'

describe Business_Hours, "update_all" do

	context "utility methods" do 
		subject{Business_Hours.new("9:00 AM","3:00 PM")}
		expected = {
								:sun => {:open => "9:00 AM", :close => "3:00 PM"},
								:mon => {:open => "9:00 AM", :close => "3:00 PM"}, 
								:tue => {:open => "9:00 AM", :close => "3:00 PM"}, 
								:wed => {:open => "9:00 AM", :close => "3:00 PM"}, 
								:thurs => {:open => "9:00 AM", :close => "3:00 PM"}, 
								:fri => {:open => "9:00 AM", :close => "3:00 PM"}, 
								:sat =>{:open => "9:00 AM", :close => "3:00 PM"}
								} 

		it "should take the paramaters for open and close and update the hash" do 
			expect(subject.update_all).to eq(expected)
		end

		it "should take the paramaters for open and close and update the hash" do
			subject.hours = expected

			expect(subject.update_one(:fri, "11:00 AM", "4:00 PM")).to eq(
				{
				:sun => {:open => "9:00 AM", :close => "3:00 PM"},
				:mon => {:open => "9:00 AM", :close => "3:00 PM"}, 
				:tue => {:open => "9:00 AM", :close => "3:00 PM"}, 
				:wed => {:open => "9:00 AM", :close => "3:00 PM"}, 
				:thurs => {:open => "9:00 AM", :close => "3:00 PM"}, 
				:fri => {:open => "11:00 AM", :close => "4:00 PM"}, 
				:sat =>{:open => "9:00 AM", :close => "3:00 PM"}
				})
		end


	end 



	
end 