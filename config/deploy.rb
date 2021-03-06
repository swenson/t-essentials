#require 'mongrel_cluster/recipes'

set :application, "directory"
set :repository,  "root@www.t-essentials.com:/home/git/directory"
set :scm, :git
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"
set :use_sudo, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

#role :app, "www.t-essentials.com"
#role :web, "www.t-essentials.com"
#role :root,  "www.t-essentials.com", :primary => true
server "www.t-essentials.com", :app, :web, :db, :primary => true
