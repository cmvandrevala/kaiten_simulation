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

	context "the + method should sum a pair of triples" do
		specify { (@triple+@zero_triple).is_equal_to?(@triple).should eql true }
		specify { (@negative_triple+@zero_triple).is_equal_to?(@negative_triple).should eql true }
		specify { (@zero_triple+@zero_triple).is_equal_to?(@zero_triple).should eql true }

		specify { (@triple+@negative_triple).x.should eql 0.9 }
		specify { (@triple+@negative_triple).y.should eql 1.1 }
		specify { (@triple+@negative_triple).z.should eql -13.0 }

		specify { (@negative_triple+@triple).x.should eql 0.9 }
		specify { (@negative_triple+@triple).y.should eql 1.1 }
		specify { (@negative_triple+@triple).z.should eql -13.0 }
	end

	context "the * method should multiply each value of a triple by a constant" do
		specify { (@triple*5).is_equal_to?(Triple.new(5.0, 10.0, -15.0)).should eql true }
		specify { (@triple*(-5)).is_equal_to?(Triple.new(-5.0, -10.0, 15.0)).should eql true }
		specify { (@triple*0).is_equal_to?(@zero_triple).should eql true }

		specify { (@negative_triple*1.0).is_equal_to?(Triple.new(-0.1, -0.9, -10.0)).should eql true }
		specify { (@negative_triple*0.000).is_equal_to?(@zero_triple).should eql true }

		specify { (@zero_triple*6.0).is_equal_to?(@zero_triple).should eql true }
		specify { (@zero_triple*0.0).is_equal_to?(@zero_triple).should eql true }
	end

	context "the is_equal_to? method should compare two triples" do
		before(:all) do
			@duplicate_triple = Triple.new(1,2,-3)
		end
		specify { @triple.is_equal_to?(@triple).should eql true }
		specify { @zero_triple.is_equal_to?(@zero_triple).should eql true }
		specify { @negative_triple.is_equal_to?(@negative_triple).should eql true }

		specify { @triple.is_equal_to?(Triple.new(1,2,-3)).should eql true }
		specify { @triple.is_equal_to?(@duplicate_triple).should eql true }

		specify { @triple.is_equal_to?(@negative_triple).should eql false }
		specify { @zero_triple.is_equal_to?(@triple).should eql false }
		specify { @negative_triple.is_equal_to?(Triple.new(1,2,3)).should eql false }
	end

	context "the method square should square each element of a triple" do
		specify {@triple.square.is_equal_to?(Triple.new(1, 4, 9)).should eql true }
		specify {@zero_triple.square.is_equal_to?(@zero_triple).should eql true }
	end

end