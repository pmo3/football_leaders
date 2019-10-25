require 'rails_helper'

RSpec.describe LeagueBlueprint do
  let(:league) { FactoryBot.create(:league) }
  let(:subject) { JSON.parse LeagueBlueprint.render(league) }

  it "includes the league name" do
    expect(subject["name"]).to eq league.name
  end

  it "includes the country name" do
    expect(subject["country"]).to eq league.country
  end

  it "includes the lng" do
    expect(subject["lng"]).to eq league.lng
  end

  it "includes the lat" do
    expect(subject["lat"]).to eq league.lat
  end
end
