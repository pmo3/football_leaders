require 'rails_helper'

RSpec.describe Ranking, type: :model do
  context "validations" do
    subject { FactoryBot.build(:ranking) }

    it { should validate_presence_of(:rank) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:points) }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end

  context "associations" do
    it { should belong_to(:team) }
    it { should belong_to(:league) }
  end
end
