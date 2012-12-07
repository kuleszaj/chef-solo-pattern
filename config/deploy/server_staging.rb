set :chef_binary, "/usr/bin/chef-solo"
set :default_shell, "bash"
set :user, "atomic"
server "198.61.216.178", :chef, :no_release => :true
set :server_ip, "198.61.216.178"
