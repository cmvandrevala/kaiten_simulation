require_relative "../kaiten.rb"

describe "Kaiten" do

	before :each do
		@kaiten = Kaiten.new
	end

	it "should be an instance of the class kaiten" do
		@kaiten.should be_an_instance_of Kaiten
	end

end