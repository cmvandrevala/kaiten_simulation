require_relative "../kunai.rb"

describe "Kunai" do
	
	before :each do
		@kunai = Kunai.new
	end

	it "should be an instance of the class Kunai" do
		@kunai.should be_an_instance_of Kunai
	end

end