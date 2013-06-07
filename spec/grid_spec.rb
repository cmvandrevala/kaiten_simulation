require_relative '../grid.rb'

describe Grid do
	
	before :each do
		@grid = Grid.new
	end

	it "should be an instance of the class Grid" do
		@grid.should be_an_instance_of Grid
	end

end