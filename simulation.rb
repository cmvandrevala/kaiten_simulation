class Simulation

	attr_reader :time_step, :kaiten, :kunai

	def initialize
		@time_step = 0.001
		@kaiten = Kaiten.new(10)
		@kunai = Kunai.new
	end

	def evolve_velocity(acceleration)
		@kunai.velocity.x += acceleration.x*@time_step
		@kunai.velocity.y += acceleration.y*@time_step
		@kunai.velocity.z += acceleration.z*@time_step
	end

	def evolve_position(acceleration)
		@kunai.position.x += (@kunai.velocity.x*@time_step + 0.5*acceleration.x*@time_step*@time_step)
		@kunai.position.y += (@kunai.velocity.y*@time_step + 0.5*acceleration.y*@time_step*@time_step)
		@kunai.position.z += (@kunai.velocity.z*@time_step + 0.5*acceleration.z*@time_step*@time_step)
	end

end