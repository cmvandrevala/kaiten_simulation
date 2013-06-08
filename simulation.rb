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
		return Triple.new(@kunai.velocity.x, @kunai.velocity.y, @kunai.velocity.z)
	end

end