require "triple"

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
		specify { @triple.x_position.should eql 1.0 }
		specify { @triple.y_position.should eql 2.0 }
		specify { @triple.z_position.should eql -3.0 }

		specify { @zero_triple.x_position.should eql 0.0 }
		specify { @zero_triple.y_position.should eql 0.0 }
		specify { @zero_triple.z_position.should eql 0.0 }

		specify { @negative_triple.x_position.should eql -0.1 }
		specify { @negative_triple.y_position.should eql -0.9 }
		specify { @negative_triple.z_position.should eql -10.0}
	end

	context "the coordinates should be floating point values" do
		specify { @triple.x_position.should be_an_instance_of Float }
		specify { @triple.y_position.should be_an_instance_of Float }
		specify { @triple.z_position.should be_an_instance_of Float }

		specify { @zero_triple.x_position.should be_an_instance_of Float }
		specify { @zero_triple.y_position.should be_an_instance_of Float }
		specify { @zero_triple.z_position.should be_an_instance_of Float }

		specify { @negative_triple.x_position.should be_an_instance_of Float }
		specify { @negative_triple.y_position.should be_an_instance_of Float }
		specify { @negative_triple.z_position.should be_an_instance_of Float }
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
		specify { @triple.r_hat.x_position.should eql ( 1.0 / Math.sqrt(14) ) }
		specify { @triple.r_hat.y_position.should eql ( 2.0 / Math.sqrt(14) ) }
		specify { @triple.r_hat.z_position.should eql ( -3.0 / Math.sqrt(14) ) }

		specify { @zero_triple.r_hat.x_position.should eql 0.0 }
		specify { @zero_triple.r_hat.y_position.should eql 0.0 }
		specify { @zero_triple.r_hat.z_position.should eql 0.0 }

		specify { @negative_triple.r_hat.x_position.should eql ( -0.1 / Math.sqrt(100.82) ) }
		specify { @negative_triple.r_hat.y_position.should eql ( -0.9 / Math.sqrt(100.82) ) }
		specify { @negative_triple.r_hat.z_position.should eql ( -10.0 / Math.sqrt(100.82) ) }
	end

	context "the r_hat vector for a non-zero vector should have a magnitude of one" do
		specify { @triple.r_hat.magnitude.should eql 1.0 }
		specify { @negative_triple.r_hat.magnitude.should eql 1.0 }
	end

	context "the r_hat vector for the zero vector should have a magnitude of zero" do
		specify { @zero_triple.r_hat.magnitude.should eql 0.0 }
	end

	context "the + method should sum a pair of triples" do
		specify { (@triple + @zero_triple).should == @triple }
		specify { (@negative_triple + @zero_triple).should == @negative_triple }
		specify { (@zero_triple + @zero_triple).should == @zero_triple }

		specify { (@triple + @negative_triple).x_position.should eql 0.9 }
		specify { (@triple + @negative_triple).y_position.should eql 1.1 }
		specify { (@triple + @negative_triple).z_position.should eql -13.0 }

		specify { (@negative_triple + @triple).x_position.should eql 0.9 }
		specify { (@negative_triple + @triple).y_position.should eql 1.1 }
		specify { (@negative_triple + @triple).z_position.should eql -13.0 }
	end

	context "the * method should multiply each value of a triple by a constant" do
		specify { (@triple*5).should == Triple.new(5.0, 10.0, -15.0) }
		specify { (@triple*-5).should == Triple.new(-5.0, -10.0, 15.0) }
		specify { (@triple*0).should == @zero_triple }

		specify { (@negative_triple*1.0).should == Triple.new(-0.1, -0.9, -10.0) }
		specify { (@negative_triple*0.000).should == @zero_triple }

		specify { (@zero_triple*6.0).should == @zero_triple }
		specify { (@zero_triple*0.0).should == @zero_triple }
	end

	context "the == method should compare two triples" do

		before(:all) do
			@duplicate_triple = Triple.new(1,2,-3)
		end

		specify { (@triple == @triple).should eql true }
		specify { (@triple == @duplicate_triple).should eql true }

		specify { @triple.should == @triple }
		specify { @zero_triple.should == @zero_triple }
		specify { @negative_triple.should == @negative_triple }

		specify { @triple.should == Triple.new(1,2,-3) }
		specify { @triple.should == @duplicate_triple }

		specify { @triple.should_not == @negative_triple }
		specify { @zero_triple.should_not == @triple }
		specify { @negative_triple.should_not == Triple.new(1,2,3) }
	end

	context "the method square should square each element of a triple" do
		specify { @triple.square.should == Triple.new(1, 4, 9) }
		specify { @zero_triple.square.should == @zero_triple }
	end

end