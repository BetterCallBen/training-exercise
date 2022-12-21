FactoryBot.define do
  factory :adoption do
    association :user
    association :tree
    name { "adoptionName" }
    starts_at { Date.today }
    ends_at { Date.today + 1.year }
  end
end
