server "10.0.0.1", :app, :web
server "10.0.0.2", :db, primary:true, :no_release => true
set :rails_env, "production"
