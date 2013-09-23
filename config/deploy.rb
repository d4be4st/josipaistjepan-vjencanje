require 'bundler/capistrano'

set :application, "vjencanje"

set :scm, 'git'
set :repository,  "git@github.com:d4be4st/josipaistjepan-vjencanje.git"
set :branch, 'master'
set :deploy_via, :remote_cache
set :user, "www-data"
set :use_sudo, false

set :rails_env, 'production'
set :deploy_to, "/var/www/v/vjencanje.hadjic.com"

host = 'hadjic.com'
set :domain, host
role :web, host
role :app, host
role :db,  host, :primary => true

namespace :deploy do

  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
