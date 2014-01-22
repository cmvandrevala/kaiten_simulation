class Triple

	attr_accessor :x_position, :y_position, :z_position

	def initialize(x_position, y_position, z_position)
		@x_position = x_position.to_f
		@y_position = y_position.to_f
		@z_position = z_position.to_f
	end

	def magnitude
		Math.sqrt(@x_position**2 + @y_position**2 + @z_position**2)
	end

	def square
		return Triple.new(@x_position**2, @y_position**2, @z_position**2)
	end

	def r_hat
		if self.magnitude == 0.0
			return Triple.new(0.0, 0.0, 0.0)
		else
			return Triple.new(@x_position/magnitude, @y_position/magnitude, @z_position/magnitude)
		end
	end

	def +(another_triple)
		x_value = @x_position + another_triple.x_position
		y_value = @y_position + another_triple.y_position
		z_value = @z_position + another_triple.z_position
		return Triple.new(x_value, y_value, z_value)
	end

	def *(constant)
		return Triple.new(constant*@x_position, constant*@y_position, constant*@z_position)
	end

	def ==(another_triple)
		if @x_position != another_triple.x_position
			return false
		elsif @y_position != another_triple.y_position
			return false
		elsif @z_position != another_triple.z_position
			return false
		else
			return true
		end
	end

end