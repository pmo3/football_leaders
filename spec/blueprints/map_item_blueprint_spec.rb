require 'rails_helper'

RSpec.describe MapItemBlueprint do
  let!(:league) { FactoryBot.create(:league) }
  let!(:map_item) { FactoryBot.create(:map_item, league: league) }
  let(:team) { FactoryBot.create(:team, league: league) }
  let(:subject) { JSON.parse MapItemBlueprint.render(map_item) }

  context "attributes" do
    it "includes the size" do
      expect(subject["size"]).to eq map_item.size
    end
  end

  context "associated attributes" do
    before do
      allow(league).to receive(:league_leader).and_return(FactoryBot.create(:ranking, team: team, date: Date.current))
    end
    it "includes the league name" do
      expect(subject["league"]["name"]).to eq map_item.league.name
    end

    it "includes the league country name" do
      expect(subject["league"]["country"]).to eq map_item.league.country
    end

    it "includes the league lng" do
      expect(subject["league"]["lng"]).to eq map_item.league.lng
    end

    it "includes the league lat" do
      expect(subject["league"]["lat"]).to eq map_item.league.lat
    end

    it "includes the team name" do
      expect(subject["leader"]["name"]).to eq team.name
    end

    it "includes the team logo" do
      expect(subject["leader"]["logo_url"]).to eq team.logo_url
    end

    it "includes the team color" do
      expect(subject["leader"]["color"]).to eq team.color
    end
  end
end
