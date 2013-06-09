class Kaiten

	attr_reader :radius, :air_density, :chakra_angular_speed, :outward_chakra_speed

	def initialize(radius, chakra_angular_speed = 1.0, outward_chakra_speed = 1.0)
		@radius = radius.to_f
		@air_density = 1.225
		@chakra_angular_speed = chakra_angular_speed.to_f
		@outward_chakra_speed = outward_chakra_speed.to_f
	end

	def total_chakra_velocity(point)
		if (point.magnitude > radius)
			return Triple.new(0.0, 0.0, 0.0) 
		else
			return sum_phi_and_r_velocities(point)
		end
	end

	private

		def sum_phi_and_r_velocities(point)
			return chakra_phi_velocity(point).add_to(chakra_r_velocity(point))
		end

		def chakra_phi_velocity(point)
			x_velocity = -point.y*chakra_angular_speed
			y_velocity = point.x*chakra_angular_speed
			return Triple.new(x_velocity, y_velocity, 0.0)
		end

		def chakra_r_velocity(point)
			return point.r_hat.times_constant(@outward_chakra_speed)
		end


end