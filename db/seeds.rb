# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


bike = 0
100.times do
  p 'in the loop'
  bike = Product.new({name: Faker::Space.star_cluster, brand: Faker::Space.moon, description: Faker::Hipster.paragraph(2), price: "$"+Faker::Commerce.price.to_s, rating: (3+rand(7)).to_s+"."+(1+rand(9)).to_s})
  bike.save
end

