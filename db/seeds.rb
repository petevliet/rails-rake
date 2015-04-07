User.delete_all

20.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              address: Faker::Address.street_address,
              age: rand(80) + 13)
end

20.times do
  Product.create(name: Faker::Commerce.product_name,
                price: rand(200) + 1,
                color: Faker::Commerce.color,
                size: rand(200) + 1)
end

20.times do
  Event.create(topic: Faker::Company.catch_phrase,
              date_time: Faker::Time.forward(21, :morning),
              location:Faker::Address.country,
              attendees: rand(300) + 1,
              notes: Faker::Company.bs)
end
