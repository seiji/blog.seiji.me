require 'capistrano_colors'

set :application, "blog.seiji.me"
set :repository,  "_site"

set :scm,               :none
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false
set :host,              'linode1'
role :web,  host
role :app,  host
role :db,   host, :primary => true

set :user,    'seiji'
set :group,   user

set :deploy_to,    "/home/#{user}/www/#{application}"

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
  
  desc 'Run jekyll to update site before uloading'
  task :update_jekyll do
    %x(rm -rf _site/* && bundle exec rake build)
  end
  
  desc "applies the nginx config symlink"
  task :nginx_symlink, :roles => :web do
    run "#{sudo} ln -nfs #{release_path}/_config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  end
  
  desc "reloads nginx config"
  task :nginx_reload, :roles => :web do
    run "#{sudo} /etc/init.d/nginx reload"
  end
end

before 'deploy:update',
'deploy:update_jekyll'

after "deploy:finalize_update",
"deploy:nginx_symlink"

before "deploy:restart",
"deploy:nginx_reload"


module UseScpForDeployment
  def self.included(base)
    base.send(:alias_method, :old_upload, :upload)
    base.send(:alias_method, :upload,     :new_upload)
  end
  
  def new_upload(from, to)
    old_upload(from, to, :via => :scp)
  end
end
Capistrano::Configuration.send(:include, UseScpForDeployment)
