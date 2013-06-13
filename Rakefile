task :default => [:run_tests]

task :update_gems do
	system("bundle update")
	system("bundle install")
end

task :run_tests do
	system("bundle exec rspec spec")
end