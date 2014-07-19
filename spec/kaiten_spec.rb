require "kaiten"
require "vector"

describe Kaiten do

	context "default settings" do
    
    before(:each) do
      @kaiten = Kaiten.new(5)
    end
    
    it "has a default radius" do
		  expect(@kaiten.radius).to eql 5.0
    end
    
    it "has a default chakra angular speed" do
		  expect(@kaiten.chakra_angular_speed).to eql 1.0
    end
    
    it "has a default air density" do
		  expect(@kaiten.air_density).to eql 1.225
    end
    
    it "has a default radial chakra velocity" do
		  expect(@kaiten.outward_chakra_speed).to eql 1.0
    end
    
	end

	context "with parameters" do
    
    before(:each) do
      @another_kaiten = Kaiten.new(6, 12, 13)
    end

    it "has a radius" do
		  expect(@another_kaiten.radius).to eql 6.0
    end
    
    it "has a chakra angular speed" do
		  expect(@another_kaiten.chakra_angular_speed).to eql 12.0
    end
    
    it "has an air density" do
		  expect(@another_kaiten.air_density).to eql 1.225
    end
    
    it "has a radial chakra velocity" do
		  expect(@another_kaiten.outward_chakra_speed).to eql 13.0
    end
    
	end

	context "chakra velocity at the edges of the kaiten" do
    
    before(:each) do
      @kaiten = Kaiten.new(5)
  		@x_edge = Vector[5, 0, 0]
  		@y_edge = Vector[0, 5, 0]
  		@z_edge = Vector[0, 0, 5]
    end
    
    it "calculates it at the x-edge" do
		  expect(@kaiten.total_chakra_velocity(@x_edge)).to eql Vector[1.0, 5.0, 0.0]
    end
    
    it "calculates it at the y-edge" do
		  expect(@kaiten.total_chakra_velocity(@y_edge)).to eql Vector[-5.0, 1.0, 0.0]
    end
    
    it "calculates it at the z-edge" do
		  expect(@kaiten.total_chakra_velocity(@z_edge)).to eql Vector[0.0, 0.0, 1.0]
    end
    
  end
  
  context "chakra velocity outside of the kaiten" do
    
    before(:each) do
      @kaiten = Kaiten.new(5)
  		@barely_outside = Vector[5.00001, 0.0, 0.0]
  		@far_away_one_direction = Vector[0, 1000, 0]
  		@far_away_xyz = Vector[100, 236, 129]
    end
    
    it "calculates it barely outside the kaiten" do
      expect(@kaiten.total_chakra_velocity(@barely_outside).magnitude).to eql 0.0
    end
    
    it "calculates it far away along one direction" do
      expect(@kaiten.total_chakra_velocity(@far_away_one_direction).magnitude).to eql 0.0
    end
    
    it "calculates it far away along many directions" do
      expect(@kaiten.total_chakra_velocity(@far_away_xyz).magnitude).to eql 0.0
    end
    
  end
  
  context "chakra velocity at arbitrary points" do
    
  	before(:each) do
      @kaiten = Kaiten.new(5)
  		@point = Vector[5/Math.sqrt(2), 5/Math.sqrt(2), 0]
  	end
  
		it "calculates the chakra velocity at some point" do
      expect(@kaiten.total_chakra_velocity(@point).x).to eql -2.82842712474619
      expect(@kaiten.total_chakra_velocity(@point).y).to eql 4.242640687119285
      expect(@kaiten.total_chakra_velocity(@point).z).to eql 0.0   
    end
    
	end

end