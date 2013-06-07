class Triple

	attr_reader :x, :y, :z

	def initialize(x,y,z)
		@x = x
		@y = y
		@z = z
	end

	def magnitude
		Math.sqrt(@x*@x + @y*@y + @z*@z)
	end

end