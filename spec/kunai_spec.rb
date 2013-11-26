require "kunai"
require "triple"

describe Kunai do
	
	before :each do
		@kunai = Kunai.new
		@default_position = Triple.new(20.0, 0.0, 0.0)
		@default_velocity = Triple.new(-25.0, 0.0, 0.0)
	end

	context "it should initialize properly" do
		it { should be_an_instance_of Kunai }
		specify { @kunai.area.should eql 0.01 }
		specify { @kunai.mass.should eql 1.0 }
		specify { @kunai.position.should == @default_position }
		specify { @kunai.velocity.should == @default_velocity }
	end

end