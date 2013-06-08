class Triple

	attr_accessor :x, :y, :z


	def initialize(x,y,z)
		@x = x.to_f
		@y = y.to_f
		@z = z.to_f
	end


	def magnitude
		Math.sqrt(@x**2 + @y**2 + @z**2)
	end


	def r_hat
		if self.magnitude == 0.0
			return Triple.new(0.0, 0.0, 0.0)
		else
			return Triple.new(x/magnitude, y/magnitude, z/magnitude)
		end
	end


	def add_to(another_triple)
		x_value = self.x + another_triple.x
		y_value = self.y + another_triple.y
		z_value = self.z + another_triple.z
		return Triple.new(x_value, y_value, z_value)
	end


	def times_constant(constant)
		x_value = constant*self.x
		y_value = constant*self.y
		z_value = constant*self.z
		return Triple.new(x_value, y_value, z_value)
	end

	def is_equal_to?(another_triple)
		if self.x != another_triple.x
			return false
		elsif self.y != another_triple.y
			return false
		elsif self.z != another_triple.z
			return false
		else
			return true
		end
	end

end