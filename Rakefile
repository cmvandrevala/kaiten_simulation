task :default => [:run_simulation]

task :update_gems do
	system("bundle update")
	system("bundle install")
end

task :run_tests do
	system("bundle exec rspec spec")
end

task :run_simulation do
	ruby "run_simulation.rb"
end

task :clean do
	system("rm output.txt")
end