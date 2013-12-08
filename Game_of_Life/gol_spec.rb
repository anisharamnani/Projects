	# regression test: any time you make a mistake. you add a test to see that it doesn't happen again. 
# the cell knows how to count his neighbors
# the world knows how to kill the cells 

class Cell 
	attr_accessor :world, :x, :y 

	def initialize (world, x=0,y=0)
		@world = world
		@x = x
		@y = y 
		world.cells << self
	end 

	def die!
		world.cells -= [self] 
	end 

	def dead? 
		# ! bang before is the opposite of true or false 
		!world.cells.include?(self)
	end 

	def alive? 
	end 

	def neighbours
		@neighbours = []
		world.cells.each do |cell|
			# has a cell to the north 
			if self.x == cell.x && self.y == (cell.y -1)
				@neighbours << cell 
			end 
		end 


		# has a cell to the north east 
		if self.x == (cell.x-1) && self.y = (cell.y)
			@neighbours << cell 
		end 

		#has a cell to the north east
		if self.x == (cell.x -1) 
			#has a cell to the west =] 
		@neighbours
		end 
	end 

	def spawn_at x, y 
		Cell.new(world, x,y)
	end 
end 

class World 
	attr_accessor :cells 
	def initialize
		@cells = []
	end 

	def tick! 
		#the cells should be processed through all of the rules. =] 
		cells.each do |cell|
			if cell.neighbours.count < 2 
				cell.die!
			end 
		end 
	end 
end 


describe "#game of life" do 
	let(:world){World.new}
	context "utility methods" do 
		subject{Cell.new(world)} #before will set it to a new instance of the cell class  
		
		it "spawn relative to" do
			cell = subject.spawn_at(3,5)
			cell.is_a?(Cell).should be true 
			cell.x.should == 3
			cell.y.should == 5
			cell.world.should == subject.world
		end
	end  

	it "detects a neighbour to the north" do 
		cell = subject.spawn_at(0,1)
		subject.neighbours.count == 1
	end 


	it "detects a neighbour to the northeast" do 
		cell = subject.spawn_at(1,1)
		subject.neighbours.count == 1
	end

	it "dies" do
		subject.die!
		subject.world.cells.should_not include(subject)
	end  

	it "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do 
		cell = Cell.new(world)
		new_cell = cell.spawn_at(2,0)
		world.tick!
		cell.should be_dead
	end 

	it "Rule 2: Any live cell with two or three live neighbours lives on to the next generation." do 
		cell = Cell.new(world)

	end 
end 