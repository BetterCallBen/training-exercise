require "rails_helper"

RSpec.describe Tree, type: :model do
  context "Validates" do
    it "should persist Tree" do
      tree = FactoryBot.build(:tree)
      expect(tree).to be_valid
    end

    it "should not persist Tree without user" do
      tree = FactoryBot.build(:tree, user: nil)
      expect(tree).to_not be_valid
    end

    it "should not persist Tree without name" do
      tree = FactoryBot.build(:tree, name: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:name]).to include("can't be blank")
    end

    it "should not persist Tree without price_per_year" do
      tree = FactoryBot.build(:tree, price_per_year: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:price_per_year]).to include("can't be blank")
    end

    it "should not persist Tree without address" do
      tree = FactoryBot.build(:tree, address: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:address]).to include("can't be blank")
    end

    it "should not persist Tree without quantity_per_year" do
      tree = FactoryBot.build(:tree, quantity_per_year: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:quantity_per_year]).to include("can't be blank")
    end

    it "should not persist Tree without fruit_type" do
      tree = FactoryBot.build(:tree, fruit_type: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:fruit_type]).to include("can't be blank")
    end

    it "should not persist Tree without description" do
      tree = FactoryBot.build(:tree, description: nil)
      expect(tree).to_not be_valid
      expect(tree.errors[:description]).to include("can't be blank")
    end

    it "should not persist Tree with invalid fruit_type" do
      tree = FactoryBot.build(:tree, fruit_type: "Patato")
      expect(tree).to_not be_valid
      expect(tree.errors[:fruit_type]).to include("is not included in the list")
    end

    it "should not persist Tree with invalid price per year" do
      tree = FactoryBot.build(:tree, price_per_year: -1)
      tree_zero = FactoryBot.build(:tree, price_per_year: 0)
      expect(tree).to_not be_valid
      expect(tree_zero).to_not be_valid
      expect(tree.errors[:price_per_year]).to include("must be greater than 0")
      expect(tree_zero.errors[:price_per_year]).to include("must be greater than 0")
    end

    it "should not persist Tree with invalid quantity_per_year" do
      tree = FactoryBot.build(:tree, quantity_per_year: -1)
      tree_zero = FactoryBot.build(:tree, quantity_per_year: 0)
      expect(tree).to_not be_valid
      expect(tree_zero).to_not be_valid
      expect(tree.errors[:quantity_per_year]).to include("must be greater than 0")
      expect(tree_zero.errors[:quantity_per_year]).to include("must be greater than 0")
    end

    it "should not persist Tree with invalid description" do
      tree = FactoryBot.build(:tree, description: "too short")
      expect(tree).to_not be_valid
      expect(tree.errors[:description]).to include("is too short (minimum is 20 characters)")
    end
  end
end
