require "kunai"
require "vector"

describe Kunai do
	
	before :each do
		@kunai = Kunai.new
		@default_position = Vector[20.0, 0.0, 0.0]
		@default_velocity = Vector[-25.0, 0.0, 0.0]
	end

	context "initialization" do
    
    it "has a default area" do
		  expect(@kunai.area).to eql 0.01
    end
    
    it "has a default mass" do
      expect(@kunai.mass).to eql 1.0
    end
    
    it "has a default position" do
      expect(@kunai.position).to eq Vector[20, 0, 0]
    end
    
    it "has a default velocity" do
      expect(@kunai.velocity).to eq Vector[-25, 0, 0]
    end
    
	end

end