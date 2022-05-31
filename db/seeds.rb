require 'faker'
10.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "start creating boats"
user = User.all
20.times do
  Boat.create!(
    make: Faker::FunnyName.four_word_name,
    capacity: rand(50),
    color: Faker::Color.color_name,
    location: Faker::Address.country,
    daily_rate: rand(1000),
    user_id: user.sample.id,
    image_url: "https://images.unsplash.com/photo-1614350391736-ed8619d63c06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2233&q=80"
  )
end
puts "finished to create 1000 boats"
puts "start creating bookings"
user = User.all
boat = Boat.all

30.times do
  Booking.create!(
    boat_id: boat.sample.id,
    user_id: user.sample.id,
    start_date: Faker::Date.backward(days: rand(50)),
    end_date: Faker::Date.backward(days: rand(120))
  )
end
puts "finished"
