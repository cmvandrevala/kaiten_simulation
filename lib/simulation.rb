class Simulation

	attr_reader :time_step, :kaiten, :kunai

	def initialize
		@time_step = 0.001
		@kaiten = Kaiten.new(10)
		@kunai = Kunai.new
	end

	def evolve_velocity(acceleration)
		@kunai.velocity = @kunai.velocity+acceleration*@time_step
	end

	def evolve_position(acceleration)
		@kunai.position = @kunai.position+@kunai.velocity*(@time_step)+acceleration*(0.5*@time_step**2)
	end

	def acceleration(force)
		return force*(1/@kunai.mass)
	end

	def force(position)
		return Vector[0, 0, 0] if outside_kaiten_range(position)
		return @kaiten.total_chakra_velocity(position).square*(self.force_coefficient)
	end

	def force_coefficient
		0.5*@kaiten.air_density*@kunai.area*self.drag_coefficient_of_sphere
	end

	def drag_coefficient_of_sphere
		0.47
	end

	private

	def outside_kaiten_range(position)
		return true if position.magnitude > @kaiten.radius
		return true if position.magnitude == 0.0
		return false
	end

end