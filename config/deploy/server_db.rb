set :chef_binary, "/usr/bin/chef-solo"
set :user, "atomic"
server "10.0.0.2", :chef, :no_release => :true
set :server_ip, "10.0.0.2"
