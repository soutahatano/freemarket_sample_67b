require 'rails_helper'
describe Picture  do
  describe '#create' do

    it 'is valid with all columns exist ' do
      picture = build(:picture)
      expect(picture).to be_valid
    end

    it 'is invalid without a item' do
      picture = build(:picture, item_id: '')
      picture.valid?
      expect(picture.errors[:item_id]).to include("を入力してください")
    end

    it 'is invalid without a picture' do
      picture = build(:picture, picture: '')
      picture.valid?
      expect(picture.errors[:picture]).to include('を入力してください')
    end

  end
end