FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    top_league { Faker::Food.dish }
  end
end
