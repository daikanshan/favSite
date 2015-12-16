# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin::User.create(username:"admin",password:"rootroot",password_confirmation:"rootroot")
(1..3).each do |member|
  Admin::Category.create(name:"category#{member}",weight:member,user_id:1)
end
(1..10).each do |member|
  Admin::Site.create(name:"site#{member}",url:"url#{member}",user_id:1,category_id:(member%3+1))
end
