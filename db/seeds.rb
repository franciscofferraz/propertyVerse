Faker::Config.locale = 'pt'

10.times do |i|
    property = Property.create!(
        name: Faker::Lorem.unique.word,
        headline: Faker::Lorem.unique.sentence,
        description: Faker::Lorem.unique.paragraphs(number: 30).join(" "),
        address_1: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: "Portugal",
        price: Money.from_amount((20..100).to_a.sample),
    )

    property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property#{i + 1}.png")), filename: property.name)
    
    (1..5).to_a.sample.times do
        Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
    end

end
