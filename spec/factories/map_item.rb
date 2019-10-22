FactoryBot.define do
  factory :map_item do
    size { Faker::Number.number(digits: 2) }
    country
  end
end
