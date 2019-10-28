require 'rails_helper'

RSpec.describe LeagueBlueprint do
  let(:ranking) { FactoryBot.create(:ranking) }
  let(:subject) { JSON.parse RankingBlueprint.render(ranking) }

  it "includes the rank" do
    expect(subject["rank"]).to eq ranking.rank
  end

  it "includes the point total" do
    expect(subject["points"]).to eq ranking.points
  end

  it "includes the team name" do
    expect(subject["team"]["name"]).to eq ranking.team.name
  end

  it "includes the team logo" do
    expect(subject["team"]["logo_url"]).to eq ranking.team.logo_url
  end

  it "includes the team color" do
    expect(subject["team"]["color"]).to eq ranking.team.color
  end
end
