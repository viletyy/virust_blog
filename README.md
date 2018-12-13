# README

### Place read me! xxx

> 我的博客


## 初始化

`$ git clone 项目地址` 

`$ cd virus_blog`

`$ gem install bundler`

`$ bundle`

`$ cp config/application.yml.example config/application.yml`

`$ vim application.yml (填写配置信息)`



## 数据库操作

  > 首次
  
  `rake db:create`
  
  `rake db:migrate`
  
  `rake db:seed`

   > 其他
   
   `rake db:migrate`
  
## 启动项目

### Server Run Development

`$ vim config/puma/development.config.rb （修改端口号，如果不需要修改则不用修改）`

`$ sh shell_script/start.development.puma.sh`

`$ sh shell_script/restart.development.puma.sh (重启项目)`


### Server Run Production

`$ vim config/puma/production.config.rb （修改端口号，如果不需要修改则不用修改）`

`$ sh shell_script/start.production.puma.sh`

`$ sh shell_script/restart.production.puma.sh (重启项目)`
