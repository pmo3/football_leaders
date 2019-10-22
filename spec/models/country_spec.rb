require 'rails_helper'

RSpec.describe Country, type: :model do
  context "validations" do
    subject { FactoryBot.build(:country) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :top_league }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lng }
    it { should validate_uniqueness_of(:name).case_insensitive }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end
end
