require "kaiten"
require "triple"

describe Kaiten do

	before :all do
		@kaiten = Kaiten.new(5)
		@another_kaiten = Kaiten.new(5, 12, 13)
		@center = Triple.new(0, 0, 0)
		@x_edge = Triple.new(5, 0, 0)
		@x_answer = Triple.new(1, 5, 0)
		@y_edge = Triple.new(0, 5, 0)
		@y_answer = Triple.new(-5, 1, 0)
		@z_edge = Triple.new(0, 0, 5)
		@z_answer = Triple.new(0, 0, 1)
		@barely_outside = Triple.new(5.00001, 0.0, 0.0)
		@far_away_one_direction = Triple.new(0, 1000, 0)
		@far_away_xyz = Triple.new(100, 236, 129)
		@edge_point = Triple.new(5/Math.sqrt(2), 5/Math.sqrt(2), 0)
		@edge_answer = Triple.new(-4/Math.sqrt(2), 6/Math.sqrt(2), 0)
		@second_edge_point = Triple.new( 1, 1, Math.sqrt(23) )
		@second_edge_answer = Triple.new(-0.8, 1.2, Math.sqrt(23)/5)
	end

	context "it should initialize a default instance of the class Kaiten" do
		specify { @kaiten.should be_an_instance_of Kaiten }
		specify { @kaiten.radius.should eql 5.0 }
		specify { @kaiten.radius.should be_an_instance_of Float }
		specify { @kaiten.chakra_angular_speed.should eql 1.0 }
		specify { @kaiten.chakra_angular_speed.should be_an_instance_of Float }
		specify { @kaiten.air_density.should eql 1.225 }
		specify { @kaiten.air_density.should be_an_instance_of Float }
		specify { @kaiten.outward_chakra_speed.should eql 1.0 }
		specify { @kaiten.outward_chakra_speed.should be_an_instance_of Float }
	end

	context "it should initialize an instance of the class Kaiten with parameters" do
		specify { @another_kaiten.chakra_angular_speed.should eql 12.0 }
		specify { @another_kaiten.chakra_angular_speed.should be_an_instance_of Float }
		specify { @another_kaiten.outward_chakra_speed.should eql 13.0 }
		specify { @another_kaiten.outward_chakra_speed.should be_an_instance_of Float }
	end

	context "the method total_chakra_velocity should return the total chakra velocity at a point" do
		specify { @kaiten.total_chakra_velocity(@center).should be_an_instance_of Triple }
		specify { @kaiten.total_chakra_velocity(@center).magnitude.should eql 0.0 }
		specify { @kaiten.total_chakra_velocity(@x_edge).should == @x_answer }
		specify { @kaiten.total_chakra_velocity(@y_edge).should == @y_answer }
		specify { @kaiten.total_chakra_velocity(@z_edge).should == @z_answer }
		specify { @kaiten.total_chakra_velocity(@barely_outside).magnitude.should eql 0.0 }
		specify { @kaiten.total_chakra_velocity(@far_away_one_direction).magnitude.should eql 0.0 }
		specify { @kaiten.total_chakra_velocity(@far_away_xyz).magnitude.should eql 0.0 }
		specify { @kaiten.total_chakra_velocity(@edge_point).should == @edge_answer }
		specify { @kaiten.total_chakra_velocity(@second_edge_point).should == @second_edge_answer }
	end

end