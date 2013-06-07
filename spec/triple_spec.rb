require_relative '../triple.rb'

describe Triple do
	
	before :each do
		@triple = Triple.new(1.0, 2.0,-3.0)
	end

	it "should be an instance of the class Triple" do
		@triple.should be_an_instance_of Triple
	end

	it "should have an x-coordinate" do
		@triple.x.should eql 1.0
	end

	it "should have a y-coordinate" do
		@triple.y.should eql 2.0
	end

	it "should have a z-coordinate" do
		@triple.z.should eql -3.0
	end

	it "should be able to calculate the magnitude of the Triple" do
		@triple.magnitude.should eql Math.sqrt(14)
	end

end