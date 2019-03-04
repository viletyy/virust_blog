# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email:"yystopf@163.com",username:"virus",gender:1,phone:"15386415121",nickname:"咸蛋黄土豆丝",password:"123456") rescue nil