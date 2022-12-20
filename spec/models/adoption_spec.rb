require "rails_helper"

RSpec.describe Adoption, type: :model do
  context "Validates" do
    it "should persist Adoption" do
      adoption = FactoryBot.build(:adoption)
      expect(adoption).to be_valid
    end

    it "should not persist Adoption without user" do
      adoption = FactoryBot.build(:adoption, user: nil)
      expect(adoption).to_not be_valid
      expect(adoption.errors[:user]).to include("must exist")
    end

    it "should not persist Adoption without tree" do
      adoption = FactoryBot.build(:adoption, tree: nil)
      expect(adoption).to_not be_valid
      expect(adoption.errors[:tree]).to include("must exist")
    end

    it "should not persist adoption without name" do
      adoption = FactoryBot.build(:adoption, name: nil)
      expect(adoption).to_not be_valid
      expect(adoption.errors[:name]).to include("can't be blank")
    end
  end
end
