FactoryBot.define do
  factory :adoption do
    association :user
    association :tree
    name { "adoptionName" }
    start_at { Date.today }
    ends_at { Date.today + 1.year }
  end
end
