class Simulation

	attr_reader :time_step, :kaiten, :kunai

	def initialize
		@time_step = 0.001
		@kaiten = Kaiten.new(10)
		@kunai = Kunai.new
	end

	def evolve_velocity(acceleration)

	end

end