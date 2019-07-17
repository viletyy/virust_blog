# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "virus_blog"
set :repo_url, "git@github.com:fightpractice/virus_blog.git"
set :default_shell, '/bin/bash -l'
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', "tmp/pids", "tmp/cache", "tmp/sockets")
set :linked_files, fetch(:linked_files, []).push('config/master.key', 'puma.rb', 'config/database.yml')


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :bundle_gemfile, -> { release_path.join('Gemfile') }

set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_control_app, false
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 2
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, false
set :puma_daemonize, false
set :puma_plugins, []  #accept array of plugins
set :puma_tag, fetch(:application)
set :puma_restart_command, 'bundle exec puma'
# before 'deploy', 'rvm:install_rvm'  # install/update RVM
after 'deploy:published', 'bundler:clean'