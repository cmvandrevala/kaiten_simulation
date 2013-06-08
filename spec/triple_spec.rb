require_relative '../triple.rb'

describe Triple do
	
	before :each do
		@triple = Triple.new(1.0, 2, -3.0)
		@zero_triple = Triple.new(0, 0, 0)
		@negative_triple = Triple.new(-0.1, -0.9, -10)
	end

	context "it should be an instance of the class Triple when initialized" do
		specify { @triple.should be_an_instance_of Triple }
		specify { @zero_triple.should be_an_instance_of Triple }
		specify { @negative_triple.should be_an_instance_of Triple }
	end

	context "it should have coordinates (x,y,z)" do
		specify { @triple.x.should eql 1.0 }
		specify { @triple.y.should eql 2.0 }
		specify { @triple.z.should eql -3.0 }

		specify { @zero_triple.x.should eql 0.0 }
		specify { @zero_triple.y.should eql 0.0 }
		specify { @zero_triple.z.should eql 0.0 }

		specify { @negative_triple.x.should eql -0.1 }
		specify { @negative_triple.y.should eql -0.9 }
		specify { @negative_triple.z.should eql -10.0}
	end

	context "the coordinates should be floating point values" do
		specify { @triple.x.should be_an_instance_of Float }
		specify { @triple.y.should be_an_instance_of Float }
		specify { @triple.z.should be_an_instance_of Float }

		specify { @zero_triple.x.should be_an_instance_of Float }
		specify { @zero_triple.y.should be_an_instance_of Float }
		specify { @zero_triple.z.should be_an_instance_of Float }

		specify { @negative_triple.x.should be_an_instance_of Float }
		specify { @negative_triple.y.should be_an_instance_of Float }
		specify { @negative_triple.z.should be_an_instance_of Float }
	end

	context "the magnitude function should return the magnitude of the triple" do
		specify { @triple.magnitude.should eql Math.sqrt(14) }
		specify { @zero_triple.magnitude.should eql 0.0 }
		specify { @negative_triple.magnitude.should eql Math.sqrt(100.82) }
	end

	context "the magnitude function should return floating point values" do
		specify { @triple.magnitude.should be_an_instance_of Float }
		specify { @zero_triple.magnitude.should be_an_instance_of Float }
		specify { @negative_triple.magnitude.should be_an_instance_of Float }
	end

	context "the r_hat function should calculate the r-hat components of the triple" do
		specify { @triple.r_hat.x.should eql ( 1.0 / Math.sqrt(14) ) }
		specify { @triple.r_hat.y.should eql ( 2.0 / Math.sqrt(14) ) }
		specify { @triple.r_hat.z.should eql ( -3.0 / Math.sqrt(14) ) }

		specify { @zero_triple.r_hat.x.should eql 0.0 }
		specify { @zero_triple.r_hat.y.should eql 0.0 }
		specify { @zero_triple.r_hat.z.should eql 0.0 }

		specify { @negative_triple.r_hat.x.should eql ( -0.1 / Math.sqrt(100.82) ) }
		specify { @negative_triple.r_hat.y.should eql ( -0.9 / Math.sqrt(100.82) ) }
		specify { @negative_triple.r_hat.z.should eql ( -10.0 / Math.sqrt(100.82) ) }
	end

	context "the r_hat vector for a non-zero vector should have a magnitude of one" do
		specify { @triple.r_hat.magnitude.should eql 1.0 }
		specify { @negative_triple.r_hat.magnitude.should eql 1.0 }
	end

	context "the r_hat vector for the zero vector should have a magnitude of zero" do
		specify { @zero_triple.r_hat.magnitude.should eql 0.0 }
	end

	it "should be able to sum a zero and non-zero triple as if they were vectors" do
		specify { @triple.add_to(@zero_triple).x.should eql 1.0}
		@zero_triple.add_to(@triple).y.should eql 2.0
		@triple.add_to(@zero_triple).z.should eql -3.0
	end

	it "should sum two triples as vectors" do
		@triple.add_to(@negative_triple).x.should eql 0.9
		@triple.add_to(@negative_triple).y.should eql 1.1
		@triple.add_to(@negative_triple).z.should eql -13.0
	end

	it "should have an associative add_to function" do
		@triple.add_to(@negative_triple).x.should eql 0.9
		@triple.add_to(@negative_triple).y.should eql 1.1
		@triple.add_to(@negative_triple).z.should eql -13.0
		@negative_triple.add_to(@triple).x.should eql 0.9
		@negative_triple.add_to(@triple).y.should eql 1.1
		@negative_triple.add_to(@triple).z.should eql -13.0
	end

	it "should multiply a triple by a positive constant" do
		@triple.times_constant(10).y.should eql 20.0
		@triple.times_constant(100).z.should eql -300.0
		@negative_triple.times_constant(1).y.should eql -0.9
		@zero_triple.times_constant(5).x.should eql 0.0
	end

	it "should multiply a triple by a negative constant" do
		@triple.times_constant(-10).y.should eql -20.0
		@triple.times_constant(-100).z.should eql 300.0
		@negative_triple.times_constant(-1).y.should eql 0.9
		@zero_triple.times_constant(-5).x.should eql 0.0
	end

	it "should multiply a triple by zero" do
		@triple.times_constant(0).x.should eql 0.0
		@triple.times_constant(0.0).z.should eql 0.0
		@negative_triple.times_constant(0).y.should eql 0.0
		@zero_triple.times_constant(0.0).x.should eql 0.0
	end

	it "should return true if a triple is compared to itself" do
		@triple.is_equal_to?(@triple).should eql true
		@zero_triple.is_equal_to?(@zero_triple).should eql true
		@negative_triple.is_equal_to?(@negative_triple).should eql true
	end

	it "should return false if a triple is compared to another triple" do
		@triple.is_equal_to?(@negative_triple).should eql false
		@zero_triple.is_equal_to?(@triple).should eql false
		@negative_triple.is_equal_to?(Triple.new(1,2,3)).should eql false
	end

	it "should return true if a triple is compared to a copy of itself" do
		duplicate_triple = Triple.new(1,2,-3)
		@triple.is_equal_to?(Triple.new(1,2,-3)).should eql true
		@triple.is_equal_to?(duplicate_triple).should eql true
	end


end