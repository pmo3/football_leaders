require 'rails_helper'

RSpec.describe TeamBlueprint do
  let(:team) { FactoryBot.create(:team) }
  let(:subject) { JSON.parse TeamBlueprint.render(team) }

  it "includes the team name" do
    expect(subject["name"]).to eq team.name
  end

  it "includes the team logo" do
    expect(subject["logo_url"]).to eq team.logo_url
  end

  it "includes the team color" do
    expect(subject["color"]).to eq team.color
  end
end
