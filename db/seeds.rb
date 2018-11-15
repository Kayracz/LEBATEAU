# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Boat.destroy_all
User.destroy_all


2.times do |i|
  User.create!(email: "#{i}-user@gmail.com", password: "123456")
end

boat_type = %w(Yatch 'Sail boat' Canoe Launch Houseboat 'Jet boat' Dinghy)

city = %w(Miami 'New York' Ibiza 'Buenos Aires' 'San Francisco' Port-Au-Prince Dakar 'Cape Town' 'Qui Nhon' Manila)

User.all.each do |user|
  10.times do |i|
    Boat.create(
      user: user,
      name: Faker::Artist.name,
      location: city.sample,
      boat_type: boat_type.sample,
      size: i,
      capacity: (i * 10),
      price:  (i * 20),
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur quae, consequuntur nobis voluptatibus sunt est laborum tenetur harum molestiae consequatur, velit nemo. Optio reprehenderit ratione dolor ex sint natus iste.",
      remote_photo_url: 'http://loremflickr.com/1200/900/sail,boat'
    )
  end
end

