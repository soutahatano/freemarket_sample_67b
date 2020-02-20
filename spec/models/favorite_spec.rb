require 'rails_helper'
describe Favorite, type: :model do
  describe '#create' do

    it 'create favorite' do
      favorite = build(:favorite)
      expect(favorite).to be_valid
    end

    it 'is invalid without a user' do
      favorite = build(:favorite, user_id: "")
      favorite.valid?
      expect(favorite.errors[:user]).to include('を入力してください')
    end

    it 'is invalid without a item' do
      favorite = build(:favorite, item_id: "")
      favorite.valid?
      expect(favorite.errors[:item]).to include('を入力してください')
    end
  end
end