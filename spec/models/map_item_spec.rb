require 'rails_helper'

RSpec.describe MapItem, type: :model do
  context "validations" do
    subject { FactoryBot.build(:map_item) }
    it { should validate_presence_of :size }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end

  context "associations" do
    it { should belong_to :league}
  end
end
