require_relative '../simulation.rb'
#require_relative '../kaiten.rb'
#require_relative '../triple.rb'

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
		@simulation.evolve_velocity(Triple.new(0,0,0))
		@simulation.kunai.velocity.x.should eql -25.0
	end

	xit "should be able to calculate the velocity at the next time step for x-acceleration" do
		@simulation.kunai.velocity.x.should eql -25.0
		@simulation.evolve_velocity(Triple.new(1000,0,0))
		@simulation.kunai.velocity.x.should eql -24.0
	end

end