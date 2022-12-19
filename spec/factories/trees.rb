FactoryBot.define do
  factory :tree do
    user
    name { Faker::Name.name }
    price_per_year { rand(1..100) }
    address { Faker::Address.street_address }
    quantity_per_year { rand(1..100) }
    fruit_type { "Apple" }
    description { Faker::Lorem.paragraph }
  end
end
