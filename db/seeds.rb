30.times do |i|
  Product.create!(
    name: Faker::Book.title,
    category: Faker::Book.genre,
    price: [900, 1200, 2000, 2200, 3000].sample,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    stock: [0, 1, 2, 3, 4, 5].sample,
    status: %i(draft published ended).sample,
    sale_start_date: Time.zone.now - rand(1..10).days,
  )
end