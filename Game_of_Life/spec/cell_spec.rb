require_relative '../lib/cell'
require_relative '../lib/world'

describe Cell do 
	world = World.new(3,3)
	subject{Cell.new(world)}
			cell_1 = Cell.new(world,-1,1,"alive")
			cell_2 = Cell.new(world,1,1, "alive")


	describe "#find_neighbours" do
		it "should find the neighbours and collect them in an array" do 
			# world = World.new
			# cell = Cell.new(world)

			expect(subject.find_neighbours).to eq([cell_1, cell_2]) 
		end
	end 

	describe "#find_neighbours" do
		it "should count the number of alive cells" do
			expect(subject.alive_neighbours).to eq(2)
		end
	end 

	describe "#change_state" do 
		it "should change the state of the cell" do 
			subject.change_state
			expect(subject.state).to eq("dead")
		end 
	end
	
end  