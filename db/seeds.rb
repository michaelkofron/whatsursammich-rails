# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "Michael", password: "michaelkofron")


6.times do 
    Sam.create(name: "Cheebo Sam", description: "The wonderful sammiches weeooo", image_url: "https://i.imgur.com/1Qawm1Ng.jpg", user_id: 1)
end