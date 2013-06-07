class Kaiten

	attr_reader :radius, :chakra_angular_speed, :outward_chakra_speed

	def initialize(radius, chakra_angular_speed = 1.0, outward_chakra_speed = 1.0)
		@radius = radius
		@chakra_angular_speed = chakra_angular_speed
		@outward_chakra_speed = outward_chakra_speed
	end

	def total_chakra_speed(point)
		return Triple.new(0.0, 0.0, 0.0) if point.magnitude > radius || point.magnitude == 0
		x_speed = -point.y*chakra_angular_speed + @outward_chakra_speed
		y_speed = point.x*chakra_angular_speed
		return Triple.new(x_speed, y_speed, 0.0)
	end

end