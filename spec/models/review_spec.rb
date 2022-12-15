require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'Validates' do

    it 'should persist Review' do
      review = FactoryBot.build(:review)
      expect(review).to be_valid
    end

    it 'should not persist Review without user' do
      review = FactoryBot.build(:review, user: nil)
      review.validate
      expect(review).to_not be_valid
    end

    it 'should not persist Review without adoption' do
      review = FactoryBot.build(:review, adoption: nil)
      review.validate
      expect(review.errors.full_messages).to include("Adoption must exist")
    end

    it 'should not persist Review without content' do
      review = FactoryBot.build(:review, content: nil)
      review.validate
      expect(review.errors.full_messages).to include("Content can't be blank")
    end

    it 'should not persist Review without rating' do
      review = FactoryBot.build(:review, rating: nil)
      review.validate
      expect(review.errors.full_messages).to include("Rating can't be blank")
    end

    it 'should not persist Review with invalid rating' do
      review = FactoryBot.build(:review, rating: -1)
      review.validate
      expect(review.errors.full_messages).to include("Rating must be greater than 0")
    end

    it 'should not persist Review with invalid description' do
      review = FactoryBot.build(:review, content: 'a' * 281)
      review.validate
      expect(review.errors.full_messages).to include("Content is too long (maximum is 280 characters)")
    end
  end
end
