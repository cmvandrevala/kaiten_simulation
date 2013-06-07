require_relative "../kaiten.rb"
require_relative "../triple.rb"

describe Kaiten do

	before :each do
		@kaiten = Kaiten.new(5)
		@center = Triple.new(0, 0, 0)
		@x_edge = Triple.new(5, 0, 0)
		@y_edge = Triple.new(0, 5, 0)
		@z_edge = Triple.new(0, 0, 5)
	end

	it "should be an instance of the class kaiten" do
		@kaiten.should be_an_instance_of Kaiten
	end

	it "should have a floating point radius" do
		@kaiten.radius.should eql 5.0
		@kaiten.radius.should be_an_instance_of Float
	end

	it "should have a default chakra angular speed of 1.0 rad/s" do
		@kaiten.chakra_angular_speed.should eql 1.0
	end

	it "should have an adjustable, floating point chakra angular speed upon initialization" do
		@new_kaiten = Kaiten.new(5,12,1.0)
		@new_kaiten.chakra_angular_speed.should eql 12.0
		@new_kaiten.chakra_angular_speed.should be_an_instance_of Float
	end

	it "should have a default outward chakra speed of 1.0 m/s" do
		@kaiten.outward_chakra_speed.should eql 1.0
	end

	it "should have an adjustable, floating point outward chakra speed upon initialization" do
		@new_kaiten = Kaiten.new(5,1,12)
		@new_kaiten.outward_chakra_speed.should eql 12.0
		@new_kaiten.outward_chakra_speed.should be_an_instance_of Float
	end

	it "should return a triple for the total_chakra_velocity" do
		@kaiten.total_chakra_velocity(@center).should be_an_instance_of Triple
	end

	it "should calculate zero total chakra speed far away from the kaiten" do
		barely_outside = Triple.new(5.00001, 0.0, 0.0)
		far_away_one_direction = Triple.new(0, 1000, 0)
		far_away_xyz = Triple.new(100, 236, 129)
		@kaiten.total_chakra_velocity(barely_outside).magnitude.should eql 0.0
		@kaiten.total_chakra_velocity(far_away_one_direction).magnitude.should eql 0.0
		@kaiten.total_chakra_velocity(far_away_xyz).magnitude.should eql 0.0
	end

	it "should calculate zero total chakra speed at the center of the kaiten" do
		@kaiten.total_chakra_velocity(@center).magnitude.should eql 0.0
	end

	it "should calculate a total chakra speed at the (x,0,0) edge of the kaiten" do
		@kaiten.total_chakra_velocity(@x_edge).x.should eql 1.0
		@kaiten.total_chakra_velocity(@x_edge).y.should eql 5.0
		@kaiten.total_chakra_velocity(@x_edge).z.should eql 0.0
	end

	it "should calculate a total chakra speed at the (0,y,0) edge of the kaiten" do
		@kaiten.total_chakra_velocity(@y_edge).x.should eql -5.0
		@kaiten.total_chakra_velocity(@y_edge).y.should eql 1.0
		@kaiten.total_chakra_velocity(@y_edge).z.should eql 0.0
	end

	it "should calculate a total chakra speed at the (0,0,z) edge of the kaiten" do
		@kaiten.total_chakra_velocity(@z_edge).x.should eql 0.0
		@kaiten.total_chakra_velocity(@z_edge).y.should eql 0.0
		@kaiten.total_chakra_velocity(@z_edge).z.should eql 1.0
	end

	it "should calculate a total chakra speed at the (5/sqrt(2),5/sqrt(2),0) edge of the kaiten" do
		edge_point = Triple.new(5/Math.sqrt(2), 5/Math.sqrt(2), 0)
		@kaiten.total_chakra_velocity(edge_point).x.should eql -4/Math.sqrt(2)
		@kaiten.total_chakra_velocity(edge_point).y.should eql 6/Math.sqrt(2)
		@kaiten.total_chakra_velocity(edge_point).z.should eql 0.0
	end

	it "should calculate a total chakra speed at the (1,1,sqrt(23)) edge of the kaiten" do
		edge_point = Triple.new( 1, 1, Math.sqrt(23) )
		@kaiten.total_chakra_velocity(edge_point).x.should eql -1.0 + 0.2
		@kaiten.total_chakra_velocity(edge_point).y.should eql 1.0 + 0.2
		@kaiten.total_chakra_velocity(edge_point).z.should eql 0.0 + Math.sqrt(23) / 5
	end

end