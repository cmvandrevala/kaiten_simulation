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

	def calculate_force(point)
		if point.magnitude > @kaiten.radius
			return Triple.new(0, 0, 0)
		else
			return Triple.new(1, 0, 0) #Will be filled in with proper value later
		end
	end

end