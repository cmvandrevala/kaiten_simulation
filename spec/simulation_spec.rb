require_relative '../simulation.rb'

describe Simulation do
	
	before(:each) do
		@simulation = Simulation.new

		@x_acceleration = Triple.new(1000, 0, 0)
		@x_time_stepped_velocity = Triple.new(-24.0, 0.0, 0.0)
		@x_time_stepped_position = Triple.new(19.9755, 0.0, 0.0)

		@y_acceleration = Triple.new(0, 1000, 0)
		@y_time_stepped_velocity = Triple.new(-25.0, 1.0, 0.0)
		@y_time_stepped_position = Triple.new(19.975, 0.0005, 0.0)

		@z_acceleration = Triple.new(0, 0, 1000)
		@z_time_stepped_velocity = Triple.new(-25.0, 0.0, 1.0)
		@z_time_stepped_position = Triple.new(19.975, 0.0, 0.0005)

		@acceleration = Triple.new(1000, 1000, 1000)
		@time_stepped_velocity = Triple.new(-24.0, 1.0, 1.0)
		@time_stepped_position = Triple.new(19.9755, 0.0005, 0.0005)

		@zero_vector = Triple.new(0, 0, 0)
		@zero_time_stepped_position = Triple.new(19.975, 0, 0)

		@x_force = Triple.new(1, 0, 0)
		@y_force = Triple.new(0, 2, 0)
		@z_force = Triple.new(0, 0, 3.1)
	end

	context "when a simulation is created" do
		it { should be_an_instance_of Simulation }
		specify { @simulation.time_step.should eql 0.001 }
		specify { @simulation.kaiten.should be_an_instance_of Kaiten }
		specify { @simulation.kunai.should be_an_instance_of Kunai }
	end

#Add more stuff here
	context "when calculating the drag force on the kunai" do
		specify { @simulation.calculate_drag_coefficient.should eql 0.47 }
		specify { @simulation.calculate_force_coefficient.should eql 0.00287875 }
		specify { @simulation.calculate_force(Triple.new(9, 0, 0)).magnitude.should_not eql 0.0 }
		specify { @simulation.calculate_force(@zero_vector).is_equal_to?(@zero_vector).should eql true }
		specify { @simulation.calculate_force(Triple.new(12,0,0)).is_equal_to?(@zero_vector).should eql true }
	end

	context "when calculating the velocity in the next time step using @zero_vector" do
		before(:each) do
			@simulation.evolve_position(@zero_vector)
			@simulation.evolve_velocity(@zero_vector)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.position.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@simulation.kunai.velocity).should eql true }
		specify { @simulation.kunai.position.is_equal_to?(@zero_time_stepped_position).should eql true }
	end

	context "when calculating the velocity in the next time step using @acceleration" do
		before(:each) do
			@simulation.evolve_position(@acceleration)
			@simulation.evolve_velocity(@acceleration)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.position.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@time_stepped_velocity).should eql true }
		specify { @simulation.kunai.position.is_equal_to?(@time_stepped_position).should eql true }
	end

	context "when calculating the parameters in the next time step using @x_acceleration" do
		before(:each) do
			@simulation.evolve_position(@x_acceleration)
			@simulation.evolve_velocity(@x_acceleration)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.position.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@x_time_stepped_velocity).should eql true }
		specify { @simulation.kunai.position.is_equal_to?(@x_time_stepped_position).should eql true }
	end

	context "when calculating the parameters in the next time step using @y_acceleration" do
		before(:each) do
			@simulation.evolve_position(@y_acceleration)
			@simulation.evolve_velocity(@y_acceleration)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.position.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@y_time_stepped_velocity).should eql true }
		specify { @simulation.kunai.position.is_equal_to?(@y_time_stepped_position).should eql true }
	end

	context "when calculating the parameters in the next time step using @z_acceleration" do
		before(:each) do
			@simulation.evolve_position(@z_acceleration)
			@simulation.evolve_velocity(@z_acceleration)
		end
		specify { @simulation.kunai.velocity.should be_an_instance_of Triple }
		specify { @simulation.kunai.position.should be_an_instance_of Triple }
		specify { @simulation.kunai.velocity.is_equal_to?(@z_time_stepped_velocity).should eql true }
		specify { @simulation.kunai.position.is_equal_to?(@z_time_stepped_position).should eql true }
	end

	context "when calculating the acceleration given a force" do
		specify { @simulation.calculate_acceleration(@acceleration).should be_an_instance_of Triple }
		specify { @simulation.calculate_acceleration(@zero_vector).magnitude.should eql 0.0 }
		specify { @simulation.calculate_acceleration(@x_force).magnitude.should eql 1.0}
		specify { @simulation.calculate_acceleration(@y_force).magnitude.should eql 2.0}
		specify { @simulation.calculate_acceleration(@z_force).magnitude.should eql 3.1}
	end

end