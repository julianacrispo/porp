require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do
 product = Product.create!(
    name: Faker::Company.name,
    )
end
products = Product.all

100.times do
  use = Use.create!(
    product: products.sample, 
    user: users.sample,
    description: Faker::Company.bs,
      )
end

puts "seed finished"
puts "#{User.count} users created"
puts "#{Product.count} products created"
puts "#{Use.count} uses created"