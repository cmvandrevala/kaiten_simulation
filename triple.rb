class Triple

	attr_reader :x, :y, :z

	def initialize(x,y,z)
		@x = x.to_f
		@y = y.to_f
		@z = z.to_f
	end

	def magnitude
		Math.sqrt(@x*@x + @y*@y + @z*@z)
	end

	def r_hat
		Triple.new(x/magnitude, y/magnitude, z/magnitude)
	end

end