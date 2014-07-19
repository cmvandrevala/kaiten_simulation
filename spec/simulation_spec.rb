require "simulation"
require "kaiten"
require "kunai"
require "vector"

describe Simulation do
	
	before(:each) do
		@simulation = Simulation.new

		@within_kaiten = Vector[9, 0, 0]
		@outside_kaiten = Vector[10.1, 0, 0]
	end

	context "the default simulation parameters" do
    
    it "has a default time step" do
		  expect(@simulation.time_step).to eql 0.001
    end
    
	end

	context "the drag force on the kunai" do
    
    it "has uses the drag coefficient of a sphere" do
		  expect(@simulation.drag_coefficient_of_sphere).to eql 0.47
    end
    
    it "calculates the coefficient of the force expression" do
		  expect(@simulation.force_coefficient).to eql 0.00287875
    end
    
    it "calculates the force within the radius of the kaiten" do
		  expect(@simulation.force(@within_kaiten)).to eql Vector[1, 81, 0]*0.00287875
    end
    
    it "calculates zero force at the center of the kaiten" do
		  expect(@simulation.force(Vector[0, 0, 0])).to eql Vector[0, 0, 0]
    end
    
    it "calculates zero force outside the radius of the kaiten" do
		  expect(@simulation.force(@outside_kaiten)).to eql Vector[0, 0, 0]
    end
    
	end

	context "zero acceleration" do
    
		before(:each) do
			@simulation.evolve_position(Vector[0, 0, 0])
			@simulation.evolve_velocity(Vector[0, 0, 0])
		end
    
    it "calculates a final velocity equal to the initial velocity" do
		  expect(@simulation.kunai.velocity).to eql @simulation.kunai.velocity
    end
    
    it "calculates a final position" do
		  expect(@simulation.kunai.position).to eql Vector[19.975, 0.0, 0.0]
    end
    
	end

	context "when calculating the velocity in the next time step using @acceleration" do
		before(:each) do
  		@acceleration = Vector[1000, 1000, 1000]
			@simulation.evolve_position(@acceleration)
			@simulation.evolve_velocity(@acceleration)
		end
    
    it "calculates the next velocity" do
		  expect(@simulation.kunai.velocity).to eql Vector[-24.0, 1.0, 1.0]
    end
    
    it "calculates the next position" do
		  expect(@simulation.kunai.position).to eql Vector[19.9755, 0.0005, 0.0005]
    end
    
	end

	context "calculating the acceleration given a force" do
    
    it "returns zero acceleration if there is no input force" do
		  expect(@simulation.acceleration(Vector[0, 0, 0]).magnitude).to eql 0.0
    end
    
    it "calculates the acceleration given a force in the x-direction" do
		  expect(@simulation.acceleration(Vector[1, 0, 0]).magnitude).to eql 1.0
    end
    
    it "calculates the acceleration given a force in the y-direction" do
		  expect(@simulation.acceleration(Vector[0, 2, 0]).magnitude).to eql 2.0
    end
    
    it "calculates the acceleration given a force in the z-direction" do
		  expect(@simulation.acceleration(Vector[0, 0, 3.1]).magnitude).to eql 3.1
    end
    
	end

end