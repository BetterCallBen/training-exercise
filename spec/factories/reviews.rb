FactoryBot.define do
  factory :review do
    association :adoption
    association :user
    content { Faker::Lorem.paragraph }
    rating { rand(1..5) }
  end
end
