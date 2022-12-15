FactoryBot.define do
  factory :review do
    content { Faker::Lorem.paragraph }
    rating { rand(1..5) }
    association :adoption
    association :user
  end
end
