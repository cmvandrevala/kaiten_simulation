require_relative '../simulation.rb'

describe Simulation do
	
	before(:each) do
		@simulation = Simulation.new
		@zero_vector = Triple.new(0, 0, 0)
	end

	context "when a simulation is created" do
		it { should be_an_instance_of Simulation }
		specify { @simulation.time_step.should eql 0.001 }
		specify { @simulation.kaiten.should be_an_instance_of Kaiten }
		specify { @simulation.kunai.should be_an_instance_of Kunai }
	end

	context "when calculating the drag force on the kunai" do
		specify { @simulation.calculate_drag_coefficient.should eql 0.47 }
		specify { @simulation.calculate_force_coefficient.should eql 0.00287875 }
		specify { @simulation.calculate_force(Triple.new(9, 0, 0)).magnitude.should_not eql 0.0 }
		specify { @simulation.calculate_force(@zero_vector).is_equal_to?(@zero_vector).should eql true }
		specify { @simulation.calculate_force(Triple.new(12,0,0)).is_equal_to?(@zero_vector).should eql true }
	end

	context "when calculating the velocity in the next time step" do
		before(:each) do
			@acceleration = Triple.new(1000, 1000, 1000)
			@answer = Triple.new(-24.0, 1.0, 1.0)
			@simulation.evolve_velocity(@acceleration)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@answer).should eql true }
	end



	it "should be able to calculate the velocity at the next time step for no acceleration" do
		@simulation.kunai.velocity.x.should eql -25.0
		@simulation.evolve_velocity(Triple.new(0, 0, 0))
		@simulation.kunai.velocity.x.should eql -25.0
	end

	it "should be able to calculate the velocity at the next time step for x-acceleration" do
		@simulation.kunai.velocity.x.should eql -25.0
		@simulation.evolve_velocity(Triple.new(1000, 0, 0))
		@simulation.kunai.velocity.x.should eql -24.0
	end

	it "should be able to calculate the velocity at the next time step for y-acceleration" do
		@simulation.kunai.velocity.y.should eql 0.0
		@simulation.evolve_velocity(Triple.new(0, 1000, 0))
		@simulation.kunai.velocity.y.should eql 1.0
	end

	it "should be able to calculate the velocity at the next time step for z-acceleration" do
		@simulation.kunai.velocity.z.should eql 0.0
		@simulation.evolve_velocity(Triple.new(0, 0, 1000))
		@simulation.kunai.velocity.z.should eql 1.0
	end

	it "should be able to calculate the velocity at the next time step for a general acceleration" do
		@simulation.kunai.velocity.x.should eql -25.0
		@simulation.kunai.velocity.y.should eql 0.0
		@simulation.kunai.velocity.z.should eql 0.0
		@simulation.evolve_velocity(Triple.new(1000, 1000, 1000))
		@simulation.kunai.velocity.x.should eql -24.0
		@simulation.kunai.velocity.y.should eql 1.0
		@simulation.kunai.velocity.z.should eql 1.0
	end

	it "should be able to calculate the next position for no acceleration" do
		@simulation.kunai.position.x.should eql 20.0
		@simulation.evolve_position(Triple.new(0, 0, 0))
		@simulation.kunai.position.x.should eql 19.975
	end

	it "should be able to calculate the next position for x-acceleration" do
		@simulation.kunai.position.x.should eql 20.0
		@simulation.evolve_position(Triple.new(1000, 0, 0))
		@simulation.kunai.position.x.should eql 19.9755
	end

	it "should be able to calculate the next position for y-acceleration" do
		@simulation.kunai.position.y.should eql 0.0
		@simulation.evolve_position(Triple.new(0, 1000, 0))
		@simulation.kunai.position.y.should eql 0.0005
	end

	it "should be able to calculate the next position for z-acceleration" do
		@simulation.kunai.position.z.should eql 0.0
		@simulation.evolve_position(Triple.new(0, 0, 1000))
		@simulation.kunai.position.z.should eql 0.0005
	end

	it "should be able to calculate the next position for a general acceleration" do
		@simulation.kunai.position.x.should eql 20.0
		@simulation.kunai.position.y.should eql 0.0
		@simulation.kunai.position.z.should eql 0.0
		@simulation.evolve_position(Triple.new(1000, 1000, 1000))
		@simulation.kunai.position.x.should eql 19.9755
		@simulation.kunai.position.y.should eql 0.0005
		@simulation.kunai.position.z.should eql 0.0005
	end







	#create a method called calculate_acceleration where F = ma

end