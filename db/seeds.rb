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
addresses = ["lisbon, portugal", "sevilla, spain", "new york, new york"]

30.times do
  category = %w(Castle Treehouse Sailboat).sample
  attributes = {
    name: Faker::Movies::StarWars.character,
    address: addresses.sample,
    photo: "https://source.unsplash.com/1600x900/?#{category}",
    rating: rand(1..5),
    category: category,
    price: rand(90..400).round(-1),
    availability: [],
    user: user,
    description:Faker::Quotes::Shakespeare.hamlet_quote
}
  Property.create(attributes)
end

puts 'Finished!'
