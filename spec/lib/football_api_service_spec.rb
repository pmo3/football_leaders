require 'rails_helper'

RSpec.describe FootballApiService do
  let(:service) { FootballApiService.new }

  context "#get_leagues_json" do
    it "makes a request to the leagues url" do
      stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagues")
      service.get_leagues_json
      expect(WebMock).to have_requested(:get, "https://api-football-v1.p.rapidapi.com/v2/leagues").with(headers: {"x-rapidapi-key" => ENV['rapidapi_key']})
    end
  end

  context "#get_standings_json_for" do
    it "makes a request to the standings url" do
      stub_request(:get, /api-football-v1.p.rapidapi.com\/v2\/leagueTable\/\d/)
      service.get_standings_json_for 2
      expect(WebMock).to have_requested(:get, "https://api-football-v1.p.rapidapi.com/v2/leagueTable/2").with(headers: {"x-rapidapi-key" => ENV['rapidapi_key']})
    end
  end
end
