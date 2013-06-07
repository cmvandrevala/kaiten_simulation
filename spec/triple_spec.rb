require_relative '../triple.rb'

describe Triple do
	
	before :each do
		@triple = Triple.new(1.0, 2, -3.0)
		@zero_triple = Triple.new(0, 0, 0)
		@negative_triple = Triple.new(-0.1, -0.9, -10)
	end

	it "should be an instance of the class Triple" do
		@triple.should be_an_instance_of Triple
		@zero_triple.should be_an_instance_of Triple
		@negative_triple.should be_an_instance_of Triple
	end

	it "should have a floating point x-coordinate" do
		@triple.x.should eql 1.0
		@zero_triple.x.should eql 0.0
		@negative_triple.x.should eql -0.1
		@triple.x.should be_an_instance_of Float
		@zero_triple.x.should be_an_instance_of Float
		@negative_triple.x.should be_an_instance_of Float
	end

	it "should have a floating point y-coordinate" do
		@triple.y.should eql 2.0
		@zero_triple.y.should eql 0.0
		@negative_triple.y.should eql -0.9
		@triple.y.should be_an_instance_of Float
		@zero_triple.x.should be_an_instance_of Float
		@negative_triple.y.should be_an_instance_of Float
	end

	it "should have a z-coordinate" do
		@triple.z.should eql -3.0
		@zero_triple.z.should eql 0.0
		@negative_triple.z.should eql -10.0
		@triple.z.should be_an_instance_of Float
		@negative_triple.z.should be_an_instance_of Float
		@zero_triple.z.should be_an_instance_of Float
	end

	it "should be able to calculate the magnitude of the Triple" do
		@triple.magnitude.should eql Math.sqrt(14)
		@zero_triple.magnitude.should eql 0.0
		@negative_triple.magnitude.should eql Math.sqrt(100.82)
		@triple.magnitude.should be_an_instance_of Float
		@negative_triple.magnitude.should be_an_instance_of Float
		@zero_triple.magnitude.should be_an_instance_of Float
	end

	it "should be able to calculate the r-hat unit vector of the Triple" do
		@triple.r_hat.x.should eql ( 1.0 / Math.sqrt(14) )
		@triple.r_hat.y.should eql ( 2.0 / Math.sqrt(14) )
		@triple.r_hat.z.should eql ( -3.0 / Math.sqrt(14) )

		@zero_triple.r_hat.x.should eql 0.0
		@zero_triple.r_hat.y.should eql 0.0
		@zero_triple.r_hat.z.should eql 0.0

		@negative_triple.r_hat.x.should eql ( -0.1 / Math.sqrt(100.82) )
		@negative_triple.r_hat.y.should eql ( -0.9 / Math.sqrt(100.82) )
		@negative_triple.r_hat.z.should eql ( -10.0 / Math.sqrt(100.82) )

		@triple.r_hat.magnitude.should eql 1.0
		@zero_triple.r_hat.magnitude.should eql 0.0
		@negative_triple.r_hat.magnitude.should eql 1.0
	end



end