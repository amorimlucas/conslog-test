app_path = "/Users/lamorim/Workspace/conslog-test"

worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)

listen app_path + '/tmp/unicorn.sock', backlog: 64
#listen(3000, backlog: 64) 

timeout 300

working_directory app_path

pid app_path + '/tmp/unicorn.pid'

stderr_path app_path + '/log/unicorn.log'
stdout_path app_path + '/log/unicorn.log'

preload_app true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end