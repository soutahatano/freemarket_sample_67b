require 'rails_helper'

describe Address, type: :model do
  describe '#create' do
    it 'is invalid without a last_name' do
      address = build(:address, last_name: '')
      address.valid?
      expect(address.errors[:last_name]).to include('を入力してください')
    end

    it 'is invalid without a first_name' do
      address = build(:address, first_name: '')
      address.valid?
      expect(address.errors[:first_name]).to include('を入力してください')
    end

    it 'is invalid without a last_name_kana' do
      address = build(:address, last_name_kana: '')
      address.valid?
      expect(address.errors[:last_name_kana]).to include('を入力してください')
    end

    it 'is invalid without a first_name_kana' do
      address = build(:address, first_name_kana: '')
      address.valid?
      expect(address.errors[:first_name_kana]).to include('を入力してください')
    end

    it 'is invalid without a prefecture' do
      address = build(:address, prefecture_id: '')
      address.valid?
      expect(address.errors[:prefecture_id]).to include('を入力してください')
    end

    it 'is invalid without a city' do
      address = build(:address, city: '')
      address.valid?
      expect(address.errors[:city]).to include('を入力してください')
    end

    it 'is invalid without a house_number' do
      address = build(:address, house_number: '')
      address.valid?
      expect(address.errors[:house_number]).to include('を入力してください')
    end

    it 'is invalid without a post_number' do
      address = build(:address, post_number: '')
      address.valid?
      expect(address.errors[:post_number]).to include('を入力してください')
    end

    it 'is invalid without a user' do
      address = build(:address, user: nil)
      address.valid?
      expect(address.errors[:user]).to include('を入力してください')
    end
    
    it 'is valid with all columns exist ' do
      user = build(:user)
      address = build(:address, user: user)
      expect(address).to be_valid
    end

  end
end