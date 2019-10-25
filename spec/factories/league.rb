FactoryBot.define do
  factory :league do
    country { Faker::Address.unique.country }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    name { Faker::Food.dish }
  end
end
