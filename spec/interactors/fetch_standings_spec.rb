require "rails_helper"

RSpec.describe FetchStandings do
  let(:league) { FactoryBot.create(:league, api_id: 2)}
  let(:context) { FetchStandings.call(league: league) }

  before do
    stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagueTable/2").to_return(status: 200, body: {api: {standings: [{
      "rank":1,
      "team_id":50,
      "teamName":"Manchester City",
      "logo":"https://www.api-football.com/public/teams/50.png"
      }]}}.to_json)
  end

  it "succeeds" do
    expect(context).to be_a_success
  end

  it "provides the standings json" do
    expect(context.standings_json).to be_present
  end

  context "failure" do
    before do
      stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagueTable/2").to_return(status: 400)
    end

    it "provides the status code" do
      expect(context.code).to eq "400"
    end

    it "provides an error message" do
      expect(context.message).to be_present
    end
  end
end
