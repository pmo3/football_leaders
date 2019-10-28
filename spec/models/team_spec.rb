require 'rails_helper'

RSpec.describe Team, type: :model do
  context "validations" do
    subject { FactoryBot.build(:team) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :logo_url }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end

  context "associations" do
    it { should belong_to(:league) }
  end

  describe "#ensure_hex" do
    let(:team) { FactoryBot.create(:team, color: "ffffff") }
    it "saves a team color with the leading # if it's not included" do
      expect(team.reload.color).to eq "#ffffff"
    end
  end
end
