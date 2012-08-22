# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create( first_name: 'Robert', last_name: 'Rivas', email: 'robertrivas@gmail.com', password: 'password1', active: true )

(1..20).each do |n|
  Post.create( title: "Title Lorem #{n}", content: "Lorem ipsum dolor sit ame", author_id: user.id )
end