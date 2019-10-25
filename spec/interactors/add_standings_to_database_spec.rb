require "rails_helper"

RSpec.describe AddStandingsToDatabase do
  let!(:league) { FactoryBot.create(:league, country: "England", name: "Premier League") }
  let(:json) do
    JSON.parse([{"rank"=>1, "teamName"=>"Liverpool", "logo"=>"https://media.api-football.com/teams/40.png","points"=>25 }].to_json )
  end
  let(:context) { AddStandingsToDatabase.call(league: league, standings_json: json) }


  it "succeeds" do
    expect(context).to be_a_success
  end

  it "creates rankings" do
    expect { context }.to change { Ranking.count }.by 1
  end
end
