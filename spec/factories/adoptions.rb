FactoryBot.define do
  factory :adoption do
    user
    tree
    name { "adoptionName" }
  end
end
