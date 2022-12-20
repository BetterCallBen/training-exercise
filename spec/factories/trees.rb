FactoryBot.define do
  factory :tree do
    association :user
    name { Faker::Name.name }
    price_per_year { rand(1..100) }
    address { Faker::Address.street_address }
    quantity_per_year { rand(1..100) }
    fruit_type { %w(Apple Orange Lemon Grapefruit).sample }
    description { Faker::Lorem.paragraph }
  end
end
