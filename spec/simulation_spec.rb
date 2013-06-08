require_relative '../simulation.rb'

describe Simulation do
	
	before :each do
		@simulation = Simulation.new
	end

	it "should be an instance of the class Simulation" do
		@simulation.should be_an_instance_of Simulation
	end

	it "should have a default time step of 1.0 ms" do
		@simulation.time_step.should eql 0.001
	end

	it "should contain a kaiten object" do
		@simulation.kaiten.should be_an_instance_of Kaiten
	end

	it "should contain a kunai object" do
		@simulation.kunai.should be_an_instance_of Kunai
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

	xit "should calculate the drag coefficient of the kunai" do
		@simulation.calculate_drag_coefficient.should eql 0.47
	end

	xit "should calculate zero force when the kunai is far from the kaiten" do
		@simulation.calculate_force(Triple.new(12, 0, 0)).magnitude.should eql 0.0
	end

	xit "should calculate non-zero force when the kunai is close to the kaiten" do
		@simulation.calculate_force(Triple.new(9, 0, 0)).magnitude.should_not eql 0.0
	end

	xit "should return the coefficient (0.5)(Density)(Drag Coefficient)(Area)" do
		@simulation.calculate_force_coefficient.should eql 0.00287875
	end

	#create a method called calculate_acceleration where F = ma

end