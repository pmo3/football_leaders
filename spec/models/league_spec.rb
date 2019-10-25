require 'rails_helper'

RSpec.describe League, type: :model do
  context "validations" do
    subject { FactoryBot.build(:league) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :country }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lng }
    it { should validate_uniqueness_of(:country).case_insensitive }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end

  context "associations" do
    it { should have_many(:rankings) }
  end
end
