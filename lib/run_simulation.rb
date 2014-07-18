require_relative "simulation"
require_relative "kunai"
require_relative "kaiten"
require_relative "vector"

simulation = Simulation.new

File.open("output.txt", 'a') {|f| f.write("#{simulation.kunai.position.x}\t#{simulation.kunai.position.y}\t#{simulation.kunai.position.z}\n") }
1000.times do |f|
	current_force = simulation.force(simulation.kunai.position)
	current_acceleration = simulation.acceleration(current_force)
	simulation.evolve_position(current_acceleration)
	simulation.evolve_velocity(current_acceleration)
	File.open("output.txt", 'a') {|f| f.write("#{simulation.kunai.position.x}\t#{simulation.kunai.position.y}\t#{simulation.kunai.position.z}\n") }
end