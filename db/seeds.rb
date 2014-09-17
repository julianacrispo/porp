require 'faker'

50.times do
 product = Product.create!(
    name: Faker::Lorem.characters(10),
    )
end
products = Product.all

100.times do
  use = Use.create!(
    product: products.sample, 
    case: Faker::Lorem.sentence,
      )
end

puts "seed finished"
puts "#{Product.count} products created"
puts "#{Use.count} uses created"