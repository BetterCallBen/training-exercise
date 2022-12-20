require "rails_helper"

RSpec.describe Review, type: :model do
  context "Validates" do
    it "should persist Review" do
      review = FactoryBot.build(:review)
      expect(review).to be_valid
    end

    it "should not persist Review without user" do
      review = FactoryBot.build(:review, user: nil)
      expect(review).to_not be_valid
    end

    it "should not persist Review without adoption" do
      review = FactoryBot.build(:review, adoption: nil)
      expect(review).to_not be_valid
      expect(review.errors[:adoption]).to include("must exist")
    end

    it "should not persist Review without content" do
      review = FactoryBot.build(:review, content: nil)
      expect(review).to_not be_valid
      expect(review.errors[:content]).to include("can't be blank")
    end

    it "should not persist Review without rating" do
      review = FactoryBot.build(:review, rating: nil)
      expect(review).to_not be_valid
      expect(review.errors[:rating]).to include("can't be blank")
    end

    it "should not persist Review with invalid rating" do
      review = FactoryBot.build(:review, rating: -1)
      expect(review).to_not be_valid
      expect(review.errors[:rating]).to include("must be in 0..5")
    end

    it "should not persist Review with too long content" do
      review = FactoryBot.build(:review, content: "a" * 115)
      expect(review).to_not be_valid
      expect(review.errors[:content]).to include("is too long (maximum is 114 characters)")
    end

    it "should not persist Review with too short content" do
      review = FactoryBot.build(:review, content: "hi")
      expect(review).to_not be_valid
      expect(review.errors[:content]).to include("is too short (minimum is 3 characters)")
    end
  end
end
