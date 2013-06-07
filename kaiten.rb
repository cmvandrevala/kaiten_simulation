class Kaiten

	attr_reader :radius, :chakra_angular_speed, :outward_chakra_speed

	def initialize(radius, chakra_angular_speed = 1.0, outward_chakra_speed = 1.0)
		@radius = radius.to_f
		@chakra_angular_speed = chakra_angular_speed.to_f
		@outward_chakra_speed = outward_chakra_speed.to_f
	end

	def total_chakra_speed(point)
		return Triple.new(0.0, 0.0, 0.0) if point.magnitude > radius || point.magnitude == 0
		x_speed = -point.y*chakra_angular_speed
		y_speed = point.x*chakra_angular_speed
		z_speed = 0.0
		x_speed += @outward_chakra_speed*point.r_hat.x if point.x != 0
		y_speed += @outward_chakra_speed*point.r_hat.y if point.y != 0
		z_speed += @outward_chakra_speed*point.r_hat.z if point.z != 0
		return Triple.new(x_speed, y_speed, z_speed)
	end

end