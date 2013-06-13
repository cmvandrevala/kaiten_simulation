task :default => [:run_tests]

task :update_gems do
	system("bundle update")
	system("bundle install")
end

task :run_tests do
	system("bundle exec rspec spec")
end

task :run_simulation do
	#File.open("output.txt", 'a') {|f| f.write("#{@kunai.position.x}\t#{@kunai.position.y}\t#{@kunai.position.z}\n") }
	#puts "#{@kunai.position.x}\t#{@kunai.position.y}\t#{@kunai.position.z}"
	#1000.times do |f|
	#	current_force = self.force(@kunai.position)
	#	current_acceleration = self.acceleration(current_force)
	#	self.evolve_position(current_acceleration)
	#	self.evolve_velocity(current_acceleration)
	#	puts "#{@kunai.position.x}\t#{@kunai.position.y}\t#{@kunai.position.z}"
	#	File.open("output.txt", 'a') {|f| f.write("#{@kunai.position.x}\t#{@kunai.position.y}\t#{@kunai.position.z}\n") }
	#end
end

task :clean do
	system("rm output.txt")
end