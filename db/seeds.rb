# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


boat_attr = {
name: Faker::HitchhikersGuideToTheGalaxy.planet,
model: Faker::HitchhikersGuideToTheGalaxy.starship,
size: rand(1..250),
capacity: rand(4..16),
price: rand(200..500)
}


10.times  do
  boat = Boat.create(boat_attr)
  boat.save
end
