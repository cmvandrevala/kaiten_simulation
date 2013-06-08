class Kunai

	attr_reader :area, :mass, :position, :velocity 

	def initialize
		@area = 0.01
		@mass = 1.0
		@position = Triple.new(20, 0, 0)
		@velocity = Triple.new(-25, 0, 0)
	end

end