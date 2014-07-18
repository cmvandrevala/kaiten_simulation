require 'matrix'
require 'vector'

describe Vector do
	
	before :each do
		@v = Vector[-0.1, -0.9, -10]
	end

	it "has an x-coordinate" do
		expect(@v.x).to eq(-0.1)
	end
  
	it "has an y-coordinate" do
		expect(@v.y).to eq(-0.9)
	end
  
	it "has an z-coordinate" do
		expect(@v.z).to eq(-10)
	end
  
  context "squaring the vector" do
    
    it "squares the x-component" do
      expect(@v.square.x > 0.009).to be true
      expect(@v.square.x < 0.011).to be true
    end
    
    it "squares the y-component" do    
      expect(@v.square.y).to eql 0.81
    end
    
    it "squares the z-component" do
      expect(@v.square.z).to eql 100  
    end
    
  end

end