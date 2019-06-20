
## 根据实际情况手动修改
self_app_path="/home/deploy/dev_www/rails/virus_blog/"
server_ip = "118.31.225.51"
user_name = "deploy"
branch = "dev"
deploy_rails_env = "development"  #  development /production
deploy_mode = "staging" # staging / production
# set :stage, :development #  development /production

# --手动填写-end----
server "#{server_ip}", user: "#{user_name}", roles: %w{app db web}, my_property: :true
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
set :deploy_to, "#{self_app_path}"
set :branch, "#{branch}"
set :unicorn_config_path, "#{self_app_path}/current/config/unicorn/#{deploy_mode}.rb"
set :unicorn_bundle_gemfile, "#{self_app_path}/current/Gemfile"
set :unicorn_rack_env, "#{deploy_rails_env}"
set :unicorn_pid, "#{self_app_path}/current/tmp/pids/unicorn.pid" #和unicorn/staging.rb pid对应
set :rails_env,   "#{deploy_rails_env}"
set :RAILS_ENV,   "#{deploy_rails_env}"

server "#{server_ip}",
       user: "#{user_name}",
       roles: %w{web app},
       ssh_options: {
           user: "#{user_name}", # overrides user setting above
           # keys: %w(/home/user_name/.ssh/id_rsa),
           forward_agent: false
       }
