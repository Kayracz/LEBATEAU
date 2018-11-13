# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
  User.create!(email: "#{i}-user@gmail.com", password: "123456")
end

User.all.each do |user|
  2.times do |i|
    Boat.create!(
      user: user,
      name: "Boat-#{user.email}-#{i}",
      boat_type: "Yatch",
      size: i,
      capacity: (i * 10),
      price:  (i * 20),
      remote_photo_url: "https://picsum.photos/200/300/?random"
    )
  end
end

