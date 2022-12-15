require 'rails_helper'

RSpec.describe Tree, type: :model do
  context 'Validates' do

    it 'should persist Tree' do
      tree = FactoryBot.build(:tree)
      expect(tree).to be_valid
    end

    it 'should not persist Tree without user' do
      tree = FactoryBot.build(:tree, user: nil)
      tree.validate
      expect(tree).to_not be_valid
    end

    it 'should not persist Tree without name' do
      tree = FactoryBot.build(:tree, name: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not persist Tree without price_per_year' do
      tree = FactoryBot.build(:tree, price_per_year: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Price per year can't be blank")
    end

    it 'should not persist Tree without address' do
      tree = FactoryBot.build(:tree, address: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Address can't be blank")
    end

    it 'should not persist Tree without quantity_per_year' do
      tree = FactoryBot.build(:tree, quantity_per_year: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Quantity per year can't be blank")
    end

    it 'should not persist Tree without fruit' do
      tree = FactoryBot.build(:tree, fruit: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Fruit can't be blank")
    end

    it 'should not persist Tree without description' do
      tree = FactoryBot.build(:tree, description: nil)
      tree.validate
      expect(tree.errors.full_messages).to include("Description can't be blank")
    end

    it 'should not persist Tree with invalid fruit' do
      tree = FactoryBot.build(:tree, fruit: 'Patato')
      tree.validate
      expect(tree.errors.full_messages).to include("Fruit is not included in the list")
    end

    it 'should not persist Tree with invalid price per year' do
      tree = FactoryBot.build(:tree, price_per_year: -1)
      tree_zero = FactoryBot.build(:tree, price_per_year: 0)
      tree.validate
      tree_zero.validate
      expect(tree.errors.full_messages).to include("Price per year must be greater than 0")
      expect(tree_zero.errors.full_messages).to include("Price per year must be greater than 0")
    end

    it 'should not persist Tree with invalid quantity_per_year' do
      tree = FactoryBot.build(:tree, quantity_per_year: -1)
      tree_zero = FactoryBot.build(:tree, quantity_per_year: 0)
      tree.validate
      tree_zero.validate
      expect(tree.errors.full_messages).to include("Quantity per year must be greater than 0")
      expect(tree_zero.errors.full_messages).to include("Quantity per year must be greater than 0")
    end

    it 'should not persist Tree with invalid description' do
      tree = FactoryBot.build(:tree, description: 'too short')
      tree.validate
      expect(tree.errors.full_messages).to include("Description is too short (minimum is 20 characters)")
    end
  end
end
