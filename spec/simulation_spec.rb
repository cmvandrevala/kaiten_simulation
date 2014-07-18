require "simulation"
require "kaiten"
require "kunai"
require "vector"

describe Simulation do
	
	before(:each) do
		@simulation = Simulation.new

		@x_acceleration = Vector[1000, 0, 0]
		@x_time_stepped_velocity = Vector[-24.0, 0.0, 0.0]
		@x_time_stepped_position = Vector[19.9755, 0.0, 0.0]

		@y_acceleration = Vector[0, 1000, 0]
		@y_time_stepped_velocity = Vector[-25.0, 1.0, 0.0]
		@y_time_stepped_position = Vector[19.975, 0.0005, 0.0]

		@z_acceleration = Vector[0, 0, 1000]
		@z_time_stepped_velocity = Vector[-25.0, 0.0, 1.0]
		@z_time_stepped_position = Vector[19.975, 0.0, 0.0005]

		@acceleration = Vector[1000, 1000, 1000]
		@time_stepped_velocity = Vector[-24.0, 1.0, 1.0]
		@time_stepped_position = Vector[19.9755, 0.0005, 0.0005]

		@zero_vector = Vector[0, 0, 0]
		@zero_time_stepped_position = Vector[19.975, 0, 0]

		@x_force = Vector[1, 0, 0]
		@y_force = Vector[0, 2, 0]
		@z_force = Vector[0, 0, 3.1]

		@within_kaiten = Vector[9, 0, 0]
		@outside_kaiten = Vector[10.1, 0, 0]
	end

	context "when a simulation is created" do
		it { should be_an_instance_of Simulation }
		specify { @simulation.time_step.should eql 0.001 }
		specify { @simulation.kaiten.should be_an_instance_of Kaiten }
		specify { @simulation.kunai.should be_an_instance_of Kunai }
	end

	context "when calculating the drag force on the kunai" do
		specify { @simulation.drag_coefficient_of_sphere.should eql 0.47 }
		specify { @simulation.force_coefficient.should eql 0.00287875 }
		specify { @simulation.force(@within_kaiten).should == Vector[1, 81, 0]*@simulation.force_coefficient }
		specify { @simulation.force(@zero_vector).should == @zero_vector }
		specify { @simulation.force(@outside_kaiten).should == @zero_vector }
	end

	context "when calculating the velocity in the next time step using @zero_vector" do
		before(:each) do
			@simulation.evolve_position(@zero_vector)
			@simulation.evolve_velocity(@zero_vector)
		end
		specify { @simulation.kunai.velocity.should == @simulation.kunai.velocity }
		specify { @simulation.kunai.position.should == @zero_time_stepped_position }
	end

	context "when calculating the velocity in the next time step using @acceleration" do
		before(:each) do
			@simulation.evolve_position(@acceleration)
			@simulation.evolve_velocity(@acceleration)
		end
		specify { @simulation.kunai.velocity.should == @time_stepped_velocity }
		specify { @simulation.kunai.position.should == @time_stepped_position }
	end

	context "when calculating the parameters in the next time step using @x_acceleration" do
		before(:each) do
			@simulation.evolve_position(@x_acceleration)
			@simulation.evolve_velocity(@x_acceleration)
		end
		specify { @simulation.kunai.velocity.should == @x_time_stepped_velocity }
		specify { @simulation.kunai.position.should == @x_time_stepped_position }
	end

	context "when calculating the parameters in the next time step using @y_acceleration" do
		before(:each) do
			@simulation.evolve_position(@y_acceleration)
			@simulation.evolve_velocity(@y_acceleration)
		end
		specify { @simulation.kunai.velocity.should == @y_time_stepped_velocity }
		specify { @simulation.kunai.position.should == @y_time_stepped_position }
	end

	context "when calculating the parameters in the next time step using @z_acceleration" do
		before(:each) do
			@simulation.evolve_position(@z_acceleration)
			@simulation.evolve_velocity(@z_acceleration)
		end
		specify { @simulation.kunai.velocity.should == @z_time_stepped_velocity }
		specify { @simulation.kunai.position.should == @z_time_stepped_position }
	end

	context "when calculating the acceleration given a force" do
		specify { @simulation.acceleration(@zero_vector).magnitude.should eql 0.0 }
		specify { @simulation.acceleration(@x_force).magnitude.should eql 1.0}
		specify { @simulation.acceleration(@y_force).magnitude.should eql 2.0}
		specify { @simulation.acceleration(@z_force).magnitude.should eql 3.1}
	end

end