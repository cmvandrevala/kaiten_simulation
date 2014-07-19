task :default => [:run_simulation]

task :sync do
	system("bundle update")
	system("bundle install")
end

task :test do
	system("bundle exec rspec spec")
end

task :run do
	ruby "lib/run_simulation.rb"
end

task :clean do
	system("rm -f output.txt")
end