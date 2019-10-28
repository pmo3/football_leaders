require 'rails_helper'

RSpec.describe LeagueBlueprint do
  let(:league) { FactoryBot.create(:league) }
  let(:subject) { JSON.parse LeagueBlueprint.render(league) }

  before do
    3.times { FactoryBot.create(:ranking, league: league, date: Date.current) }
    2.times { FactoryBot.create(:ranking, league: league, date: Date.yesterday)}
  end

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

  it "includes a standings object" do
    expect(subject["standings"]).to be_present
  end

  it "includes the correct number of standings" do
    expect(subject["standings"].count).to eq 3
  end
end
