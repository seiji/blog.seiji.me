require 'capistrano_colors'

set :application, "blog.seiji.me"
set :repository,  "_site"

set :scm,               :none
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false
set :host,              'linode2'
role :web,  host
role :app,  host
role :db,   host, :primary => true

set :user,    'seiji'
set :group,   user

set(:dest) { Capistrano::CLI.ui.ask("Destination: ") }

if dest == 'dev'
  set :deploy_to,    "/home/#{user}/www/dev.#{application}"
elsif dest == 'www'
  set :deploy_to,    "/home/#{user}/www/dev.#{application}"
  # set :deploy_to,    "/home/#{user}/sites/#{application}.com"
end

before 'deploy:update', 'deploy:update_jekyll'
namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
  
  desc 'Run jekyll to update site before uploading'
  task :update_jekyll do
    %x(rm -rf _site/* && jekyll build)
  end
end
