# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Property.destroy_all
user = User.all.sample
user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)

30.times do
  category = %w(Castle Treehouse Sailboat).sample
  attributes = {
    name: Faker::Name,
    location: Faker::Address.unique,
    photo: "https://source.unsplash.com/1600x900/?#{category}",
    rating: rand(1..5),
    category: category,
    price: rand(90..400).round(-1),
    available: [true, false].sample,
    user:id: Faker::Number.number(10),
    created_at: Faker::Date.between(10.days.ago, 12.days.ago),
    updated_at: Faker::Date.between(2.days.ago, Date.today),
    user: user,
}
end

Property.create(attributes)
puts 'Finished!'
