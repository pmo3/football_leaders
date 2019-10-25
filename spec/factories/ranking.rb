FactoryBot.define do
  factory :ranking do
    rank { Faker::Number.number(digits: 1) }
    date { Faker::Date.backward(days: 365) }
    points { Faker::Number.number(digits: 1) }
    league
    team
  end
end
