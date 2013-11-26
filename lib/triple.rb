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

	def square
		return Triple.new(@x**2, @y**2, @z**2)
	end

	def r_hat
		if self.magnitude == 0.0
			return Triple.new(0.0, 0.0, 0.0)
		else
			return Triple.new(x/magnitude, y/magnitude, z/magnitude)
		end
	end

	def +(another_triple)
		x_value = @x + another_triple.x
		y_value = @y + another_triple.y
		z_value = @z + another_triple.z
		return Triple.new(x_value, y_value, z_value)
	end

	def *(constant)
		return Triple.new(constant*@x, constant*@y, constant*@z)
	end

	def ==(another_triple)
		if @x != another_triple.x
			return false
		elsif @y != another_triple.y
			return false
		elsif @z != another_triple.z
			return false
		else
			return true
		end
	end

end