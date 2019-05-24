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
#addresses = ["lisbon, portugal", "sevilla, spain", "new york, new york"]

# 30.times do
#   category = %w(Castle Treehouse Sailboat).sample
#   attributes = {
#     name: Faker::Movies::StarWars.character,
#     address: addresses.sample,
#     photo: "https://source.unsplash.com/1600x900/?#{category}",
#     rating: rand(1..5),
#     category: category,
#     price: rand(90..400).round(-1),
#     availability: [],
#     user: user,
#     description:Faker::Quotes::Shakespeare.hamlet_quote
# }
# end

attributes = [

 {
  name: "Floaty Boathouse",
  address: "Kingston, Jamaica",
  photo: 'https://tse2.mm.bing.net/th?id=OIP.5_DYMMB4LLX1tbVfXznPOQHaEK&pid=Api',
  category: 'Sailboat',
  rating: 4,
  price: 250,
  availability: [],
  user: user,
  description: "Really awesome boathouse. Wont sink I promise."
  },

 {
  name: "Mirror House",
  address: "Harads, Sweden",
  photo: 'https://static.boredpanda.com/blog/wp-content/uuuploads/amazing-treehouses/amazing-treehouses-10.jpg',
  category: 'Treehouse',
  rating: 2,
  price: 300,
  availability: [],
  user: user,
  description: "Almost invisible and perfect for hiding, the Mirror House is part of the Tree Hotel project in the North of Sweden. As cool as it looks, we’re afraid the house may be invisible to birds."
  },

 {
  name: "Lakeside Castle Retreat",
  address: "Connemara, Ireland",
  photo: 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAev4Oa.img?h=832&w=1598&m=6&q=60&u=t&o=f&l=f',
  category: 'Castle',
  rating: 4,
  price: 800,
  availability: [],
  user: user,
  description: "Charming lake-side castle with comfy beds that will allow guests to attain Sleeping Beauty levels of rest."
  },

 {
  name: "Hideaway House",
  address: "Miami, Florida",
  photo: 'https://images.unsplash.com/photo-1534450539339-6d1c81ad18e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  category: 'Castle',
  rating: 4,
  price: 375,
  availability: [],
  user: user,
  description: "It's a small world afterall."
  },

  {
  name: "Shannon's Texas Dreamboat",
  address: "A Lake Near Mark's Mom's House",
  photo: 'https://images.unsplash.com/photo-1524768570-c4bbd81adcad?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
  category: 'Sailboat',
  rating: 5,
  price: 93.65,
  availability: [],
  user: user,
  description: 'Change your life. Learn to code ... on the high seas!'
  },

  {
  name: 'Golden Palace of Versailles',
  address: 'Versailles, France',
  photo: 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAenDQz.img?h=832&w=1598&m=6&q=60&u=t&o=f&l=f',
  category: 'Castle',
  rating: rand(1..5),
  price: 1200,
  availability: [],
  user: user,
  description: 'Spend a few days (and nights) living like royalty in this luxurious palace in France!'
  },

  {
  name: 'Matsumoto Castle',
  address: 'Matsumoto, Japan',
  photo: 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAen2i9.img?h=832&w=1598&m=6&q=60&u=t&o=f&l=f&x=964&y=486',
  category: 'Castle',
  rating: rand(1..5),
  price: 1000,
  availability: [],
  user: user,
  description: 'Make history booking a stay at this historic castle in Japan.'
  },

  {
  name: 'Out’n’About Treehouse Treesort',
  address: 'Cave Junction, Oregon',
  photo: 'https://www.fodors.com/wp-content/uploads/2018/11/5-Out-n-About-Treehouses-Treesort-1-975x650.jpg',
  category: 'Treehouse',
  rating: rand(1..5),
  price: 160,
  availability: [],
  user: user,
  description: 'Each tree house is unique and sparingly decorated with a rustic, camping feel, and the Treesort is modeled as a bed and breakfast with the events and scope of a resort.'
  },

  {
  name: 'Jackson Hole Hideout',
  address: 'Jackson Hole, Wyoming',
  photo: 'https://www.fodors.com/wp-content/uploads/2018/11/9jacksonholehideout-975x650.jpg',
  category: 'Treehouse',
  rating: rand(1..5),
  price: 100,
  availability: [],
  user: user,
  description: 'An extension of Jackson Hole’s nature-driven culture, Jackson Hole Hideout offers an elevated lodge experience in the heart of the forest. Guests can start the day with a hot and hearty breakfast before heading out for bird watching, nearby horseback riding, and whitewater rafting.'
  },

  {
  name: 'The Aviary at Wheatleigh Hotel',
  address: 'Lenox, Massachusetts',
  photo: 'https://www.fodors.com/wp-content/uploads/2018/11/3_TheAviary_TreehouseHotelsAviary-Downstairs1-1-975x650.jpg',
  category: 'Treehouse',
  rating: rand(1..5),
  price: 200,
  availability: [],
  user: user,
  description: 'Luxury meets nature-chic at The Aviary, Wheatleigh Hotel‘s top-of-the-line, two-story treetop suite. Take the time to descend from the treetops and make use of the resort’s expansive 22 acres, where no stay is complete without a visit to the immaculate wine cellar and the picture-perfect pool.'
  },

  {
  name: 'Amazonian Rainforest Treetop Lodge',
  address: 'Iquitos, Peru',
  photo: 'https://treehouselodge.com/wp-content/uploads/2015/06/Treehouses1.jpg',
  category: 'Treehouse',
  rating: rand(1..5),
  price: 80,
  availability: [],
  user: user,
  description: 'This treehouse Lodge is located on the beautiful black waters of the Yarapa River – a 2-hour boat ride from the Amazonian city of Iquitos, Peru. Stay here to get away from it all.'
  },

  {
  name: 'Tsala Treetop Lodge',
  address: 'Plettenberg, South Africa',
  photo: 'https://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/201304-w-coolest-treehouse-hotels-tsala-treetop-lodge.jpg?itok=Py4jChAC',
  category: 'Treehouse',
  rating: rand(1..5),
  price: 230,
  availability: [],
  user: user,
  description: 'Overlooking the Tsitsikamma Forest, this high-design stone-and-glass lodge counts 10 secluded tree-house suites, each with floor-to-ceiling bedroom windows, a log fireplace in the living room, a private deck, and an infinity-edge pool.'
  }
]

attributes.each do |attr|
  Property.create(attr)
end

puts 'Finished!'
