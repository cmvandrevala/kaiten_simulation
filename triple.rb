class Triple

	attr_reader :x, :y, :z

	def initialize(x,y,z)
		@x = x
		@y = y
		@z = z

		@rho = self.magnitude
		@phi = Math.acos(@z / @rho)
		@theta = Math.asin( @y / ( @rho*Math.sin(@phi) ) )
	end

	def magnitude
		Math.sqrt(@x*@x + @y*@y + @z*@z)
	end

	def r_hat
		Triple.new(x/magnitude, y/magnitude, z/magnitude)
	end

end