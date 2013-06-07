require_relative "../kunai.rb"

describe Kunai do
	
	before :each do
		@kunai = Kunai.new
	end

	it "should be an instance of the class Kunai" do
		@kunai.should be_an_instance_of Kunai
	end

	it "should have a default cross sectional area of 10 cm^2" do
		@kunai.area.should eql 0.01
	end

	it "should have a default position of (20.0, 0.0, 0.0)" do
		@kunai.position.x.should eql 20.0
		@kunai.position.y.should eql 0.0
		@kunai.position.z.should eql 0.0
	end

	it "should have a default mass of 1.0 kg" do
		@kunai.mass.should eql 1.0
	end

	it "should have a default speed of (-25.0, 0.0, 0.0)" do
		@kunai.velocity.x.should eql -25.0
		@kunai.velocity.y.should eql 0.0
		@kunai.velocity.z.should eql 0.0
	end

end