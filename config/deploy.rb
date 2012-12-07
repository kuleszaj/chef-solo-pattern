require "bundler/capistrano"
require 'rvm/capistrano'
require 'capistrano/ext/multistage'
set :stages, %w(production staging server_app)
set :default_stage, "staging"

default_run_options[:pty] = true 
ssh_options[:forward_agent] = true

set :rvm_string, "ruby-1.9.3-p194"
set :rvm_type, :system

set :application, "Chef Solo Pattern"
set :repository,  "git@github.com:kuleszaj/chef-solo-pattern.git"
set :deploy_to, "/var/www/chef-solo-pattern"
set :branch, "master"


set :scm, :git
set :scm_verbose, true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_via, :remote_cache
set :use_sudo, true
set :keep_releases, 3
set :user, "atomic"

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end

namespace :bootstrap do
  task :default do
    system("knife bootstrap -d chef-solo -x #{user} --sudo #{server_ip}")
  end
end

namespace :chef do
  task :default do
    system("tar czf 'chef.tar.gz' -C chef/ .")
    upload("chef.tar.gz","/home/#{user}",:via => :scp)
    run("rm -rf /home/#{user}/chef")
    run("mkdir -p /home/#{user}/chef")
    run("tar xzf 'chef.tar.gz' -C /home/#{user}/chef")
    sudo("/bin/bash -c 'cd /home/#{user}/chef && #{chef_binary} -c solo.rb -j #{stage}.json'")
    run("rm -rf /home/#{user}/chef.tar.gz")
    run("rm -rf /home/#{user}/chef")
  end
end
