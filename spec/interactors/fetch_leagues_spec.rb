require "rails_helper"

RSpec.describe FetchLeagues do
  let(:context) { FetchLeagues.call }
  let!(:country) { FactoryBot.create(:league, country: "England", name: "Premier League") }

  before do
    stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagues/season/2019").to_return(status: 200, body: {api: {leagues: [{
      "league_id":1,
      "name":"Premier League",
      "type":"League",
      "country":"England",
      "season":2019,
      }]}}.to_json)
  end

  it "succeeds" do
    expect(context).to be_a_success
  end

  it "provides the leagues json" do
    expect(context.json).to be_present
  end

  it "provides a list of top leagues" do
    expect(context.top_leagues).to eq([country])
  end

  context "failure" do
    before do
      stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagues/season/2019").to_return(status: 400, body: {api: {leagues: ["yes"]}}.to_json)
    end

    it "provides the status code" do
      expect(context.code).to eq "400"
    end

    it "provides an error message" do
      expect(context.message).to be_present
    end
  end
end
