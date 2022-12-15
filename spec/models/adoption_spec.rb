require 'rails_helper'

RSpec.describe Adoption, type: :model do
  context 'Validates' do
    it 'should persist Adoption' do
      adoption = FactoryBot.build(:adoption)
      expect(adoption).to be_valid
    end

    it 'should not persist Adoption whitout user' do
      adoption = FactoryBot.build(:adoption, user: nil)
      adoption.validate
      expect(adoption.errors.full_messages).to include("User must exist")
    end
    it 'should not persist Adoption whitout tree' do
      adoption = FactoryBot.build(:adoption, tree: nil)
      adoption.validate
      expect(adoption.errors.full_messages).to include("Tree must exist")
    end
    it 'should not persist adoption whitout name' do
      adoption = FactoryBot.build(:adoption, name: nil)
      adoption.validate
      expect(adoption.errors.full_messages).to include("Name can't be blank")
    end
  end
end
