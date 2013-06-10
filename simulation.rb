class Simulation

	attr_reader :time_step, :kaiten, :kunai

	def initialize
		@time_step = 0.001
		@kaiten = Kaiten.new(10)
		@kunai = Kunai.new
	end

	def evolve_velocity(acceleration)
		@kunai.velocity = @kunai.velocity.add_to(acceleration.times_constant(@time_step))
	end

	def evolve_position(acceleration)
		@kunai.position = @kunai.position.add_to(@kunai.velocity.times_constant(@time_step))
		@kunai.position = @kunai.position.add_to(acceleration.times_constant(0.5*@time_step**2))
	end

	def calculate_acceleration(force)
		return force.times_constant(1/@kunai.mass)
	end

	def calculate_force(position)
		if position.magnitude > @kaiten.radius || position.magnitude == 0.0
			return Triple.new(0, 0, 0)
		else
			return @kaiten.total_chakra_velocity(position).square.times_constant(self.calculate_force_coefficient)
		end
	end

	def calculate_force_coefficient
		0.5*@kaiten.air_density*@kunai.area*self.calculate_drag_coefficient
	end

	def calculate_drag_coefficient
		0.47 #Sphere
	end

end