
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
