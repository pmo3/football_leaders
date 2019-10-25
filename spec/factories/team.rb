FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    logo_url { Faker::Internet.domain_name }
    color { Faker::Color.hex_color }
    league
  end
end
