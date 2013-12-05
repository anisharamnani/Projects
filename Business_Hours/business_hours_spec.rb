require './lib/Business_Hours'

describe Business_Hours do
	subject{Business_Hours.new("09:00 AM","03:00 PM")}
	expected = {
							:sun => {:open => "09:00 AM", :close => "03:00 PM", :opened => true},
							:mon => {:open => "09:00 AM", :close => "03:00 PM", :opened => true}, 
							:tue => {:open => "09:00 AM", :close => "03:00 PM", :opened => true}, 
							:wed => {:open => "09:00 AM", :close => "03:00 PM", :opened => true}, 
							:thu => {:open => "09:00 AM", :close => "03:00 PM", :opened => true}, 
							:fri => {:open => "09:00 AM", :close => "03:00 PM", :opened => true}, 
							:sat =>{:open => "09:00 AM", :close => "03:00 PM", :opened => true}
							} 


	describe "#update_all" do 
		it "#subject_all should take the paramaters for open and close and update the hash" do 
			expect(subject.update_all).to eq(expected)
		end
	end 

	describe "update_one" do 
		it "should take the paramaters for open and close and update the hash" do
			subject.hours = expected
			subject.update_one("fri", "11:00 AM", "04:00 PM")
			expect(subject.hours[:fri][:open]).to eq("11:00 AM")
			expect(subject.hours[:fri][:close]).to eq("04:00 PM")
		end 
	end 

	describe "#calculate_deadline" do 
		it "should calculate the deadline given a date and deadline time" do
			expect(subject.calculate_deadline(2*60*60, "Jun 7, 2010 09:10 AM")).to eq("Mon Jun 07 11:10:00 2010")
		end
	end 

	describe "#close" do 
		it "should set a day to closed" do 
			subject.hours = expected
			subject.close("mon")
			expect(subject.hours[:mon][:opened]).to eq(false)
		end 
	end 

	describe "#closed?" do
		it "should return the closed days" do 
			subject.hours = expected
			subject.close("mon") 
			expect(subject.closed?).to eq(["mon"])
		end 
	end 

	describe "#compare" do 
		it "should compare the return time to the hours" do 
		end 
	end 

end 