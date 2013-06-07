require_relative "../kaiten.rb"
require_relative "../triple.rb"

describe Kaiten do

	before :each do
		@center = Triple.new(0, 0, 0)
		@decimal_center = Triple.new(0.0, 0.0, 0.0)
		@mixed_center = Triple.new(0, 0.0, 0)
		@kaiten = Kaiten.new(5)
	end

	it "should be an instance of the class kaiten" do
		@kaiten.should be_an_instance_of Kaiten
	end

	it "should have a radius" do
		@kaiten.radius.should eql 5
	end

	it "should have a default rotation speed" do
		@kaiten.chakra_angular_speed.should eql 1.0
	end

	it "should have an adjustable rotation speed upon initialization" do
		@new_kaiten = Kaiten.new(5,12)
		@new_kaiten.chakra_angular_speed.should eql 12
	end

	it "should have a default outward chakra speed" do
		@kaiten.outward_chakra_speed.should eql 1.0
	end

	it "should have an adjustable outward chakra speed upon initialization" do
		@new_kaiten = Kaiten.new(5,1,12)
		@new_kaiten.outward_chakra_speed.should eql 12
	end

	it "should return a triple for the total_chakra_speed" do
		@kaiten.total_chakra_speed(@center).should be_an_instance_of Triple
		@kaiten.total_chakra_speed(@decimal_center).should be_an_instance_of Triple
		@kaiten.total_chakra_speed(@mixed_center).should be_an_instance_of Triple
	end

	it "should calculate zero total chakra speed far away from the kaiten" do
		barely_outside = Triple.new(5.001, 0.0, 0.0)
		far_away_one_direction = Triple.new(0, 1000, 0)
		far_away_xyz = Triple.new(100, 236, 129)
		@kaiten.total_chakra_speed(barely_outside).magnitude.should eql 0.0
		@kaiten.total_chakra_speed(far_away_one_direction).magnitude.should eql 0.0
		@kaiten.total_chakra_speed(far_away_xyz).magnitude.should eql 0.0
	end

	it "should calculate zero total chakra speed at the center of the kaiten" do
		@kaiten.total_chakra_speed(@center).magnitude.should eql 0.0
		@kaiten.total_chakra_speed(@decimal_center).magnitude.should eql 0.0
		@kaiten.total_chakra_speed(@mixed_center).magnitude.should eql 0.0
	end

	it "should calculate a total speed at the (x,0,0) edge of the kaiten" do
		x_edge = Triple.new(5,0,0)
		@kaiten.total_chakra_speed(x_edge).x.should eql 1.0
		@kaiten.total_chakra_speed(x_edge).y.should eql 5.0
		@kaiten.total_chakra_speed(x_edge).z.should eql 0.0
	end

	it "should calculate a total speed at the (0,y,0) edge of the kaiten" do
		y_edge = Triple.new(0,5,0)
		@kaiten.total_chakra_speed(y_edge).x.should eql -5.0
		@kaiten.total_chakra_speed(y_edge).y.should eql 1.0
		@kaiten.total_chakra_speed(y_edge).z.should eql 0.0
	end

end