require 'rails_helper'
describe Favorite, type: :model do
  describe '#create' do

    it 'create favorite' do
      favorite = build(:favorite)
      expect(favorite).to be_valid
    end

    it 'not create favorite' do
      favorite = build(:favorite, user_id: "")
      expect(favorite).to_not be_valid
    end

    it 'not create favorite' do
      favorite = build(:favorite, item_id: "")
      expect(favorite).to_not be_valid
    end
  end
end