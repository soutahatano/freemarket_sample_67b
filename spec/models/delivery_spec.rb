require 'rails_helper'
describe Delivery, type: :model do
  describe '#create' do

    it 'is valid with all columns exist ' do
      delivery = build(:delivery)
      expect(delivery).to be_valid
    end

    it 'is invalid without a item' do
      delivery = build(:delivery, item_id: '')
      delivery.valid?
      expect(delivery.errors[:item_id]).to include("を入力してください")
    end

    it 'is invalid without a deliverycharge_id' do
      delivery = build(:delivery, deliverycharge_id: '')
      delivery.valid?
      expect(delivery.errors[:deliverycharge_id]).to include('を入力してください')
    end
    
    it 'is invalid without a deliveryday_id' do
      delivery = build(:delivery, deliveryday_id: '')
      delivery.valid?
      expect(delivery.errors[:deliveryday_id]).to include('を入力してください')
    end
    
    it 'is invalid without a prefecture_id' do
      delivery = build(:delivery, prefecture_id: '')
      delivery.valid?
      expect(delivery.errors[:prefecture_id]).to include('を入力してください')
    end

  end
  describe '#update' do

    it 'is invalid without a item' do
      delivery = build(:delivery)
      delivery.update(item_id: '')
      delivery.valid?
      expect(delivery.errors[:item_id]).to include("を入力してください")
    end

    it 'is invalid without a deliverycharge_id' do
      delivery = build(:delivery)
      delivery.update(deliverycharge_id: '')
      delivery.valid?
      expect(delivery.errors[:deliverycharge_id]).to include('を入力してください')
    end
    
    it 'is invalid without a deliveryday_id' do
      delivery = build(:delivery)
      delivery.update(deliveryday_id: '')
      delivery.valid?
      expect(delivery.errors[:deliveryday_id]).to include('を入力してください')
    end
    
    it 'is invalid without a prefecture_id' do
      delivery = build(:delivery)
      delivery.update(prefecture_id: '')
      delivery.valid?
      expect(delivery.errors[:prefecture_id]).to include('を入力してください')
    end
    
  end
end