class Kaiten

	attr_reader :radius, :chakra_angular_speed, :outward_chakra_speed

	def initialize(radius, chakra_angular_speed = 1.0, outward_chakra_speed = 1.0)
		@radius = radius.to_f
		@chakra_angular_speed = chakra_angular_speed.to_f
		@outward_chakra_speed = outward_chakra_speed.to_f
	end

	def total_chakra_velocity(point)
		if (point.magnitude > radius)
			return Triple.new(0.0, 0.0, 0.0) 
		else
			return Triple.new( sum_phi_and_r_velocities(point).x, 
							   sum_phi_and_r_velocities(point).y,
							   sum_phi_and_r_velocities(point).z )
		end
	end


	private

		def chakra_phi_velocity(point)
			x_velocity = -point.y*chakra_angular_speed
			y_velocity = point.x*chakra_angular_speed
			return Triple.new(x_velocity, y_velocity, 0.0)
		end

		def chakra_r_velocity(point)
			x_velocity = @outward_chakra_speed*point.r_hat.x
			y_velocity = @outward_chakra_speed*point.r_hat.y
			z_velocity = @outward_chakra_speed*point.r_hat.z
			return Triple.new(x_velocity, y_velocity, z_velocity)
		end

		def sum_phi_and_r_velocities(point)
			x_velocity = chakra_phi_velocity(point).x + chakra_r_velocity(point).x
			y_velocity = chakra_phi_velocity(point).y + chakra_r_velocity(point).y
			z_velocity = chakra_phi_velocity(point).z + chakra_r_velocity(point).z
			return Triple.new(x_velocity, y_velocity, z_velocity)
		end



end