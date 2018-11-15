# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Boat.destroy_all
User.destroy_all

images = %w(http://res.cloudinary.com/deruwllkv/image/upload/v1542312646/wehfbsghaupq9uyw4jzb.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312650/hvqluwswg35dj3b1orf2.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312652/xzefeunnplvlwetb9xyu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312654/gpl83ypcvqnrcsz4gcy4.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312656/gbpmr8s1f2yfarijbteu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312659/hnljwao3yiy6aw3fvfxv.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312661/yraaocf9mwza5ub6v5zk.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312663/pkou5a9c2qb7xitt8qvi.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312666/lhpfqn0oqi2pvw1h0bzg.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312669/xtjg2bacghb5tm5wdlrp.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312670/fqhoy82zsijawcslqrch.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312673/kwrppwjberie1qhxr3m1.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312677/od8whw9vfxgjwahmpnwu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312680/qlqpa2ilmeauokd51oi7.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312682/x0ouktxfwumvhdidx2ju.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312685/ijtvkqbiiylfyhhp4tel.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312689/rz5zjefz1fsb9usc61ba.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312692/u3b1psizzyvumnp8rsjv.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312695/cxvi5a5fthobohxt6f1h.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312698/zg14t4yqh2cmqdbnk4zx.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312701/fnqk41nux38p6v3lsue0.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312703/micns3v4a5mglcrkhoxx.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312709/sjgsuyxrlyqmjc9h0wah.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312712/s9wyyrtg34wwnssnuzyn.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312714/satk8jil4bw0eqryawyi.jpg)


3.times do |i|
  User.create!(email: "#{i}-user@gmail.com", password: "123456")
end

boat_type = %w(Yatch 'Sail boat' Canoe Launch Houseboat 'Jet boat' Dinghy)

city = %w(Miami 'New York' Ibiza 'Buenos Aires' 'San Francisco' Port-Au-Prince Dakar 'Cape Town' 'Qui Nhon' Manila)

User.all.each do |user|

  25.times do |i|
    Boat.create(
      user: user,
      name: Faker::Artist.name,
      location: city.sample,
      boat_type: boat_type.sample,
      size: (i * 5),
      capacity: (i * 10),
      price:  (i * 20),
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur quae, consequuntur nobis voluptatibus sunt est laborum tenetur harum molestiae consequatur, velit nemo. Optio reprehenderit ratione dolor ex sint natus iste.",
      remote_photo_url: images[i]
    )
  end
end

