require 'rails_helper'
describe Item  do
  describe '#create' do
    it 'is invalid without picture' do
       item = build(:item, picture: '')
       item.valid?
      expect(item.errors[:picture]).to include('を入力してください')
    end
    
    
    
    it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
      expect(item.errors[:name]).to include('を入力してください')
    end
    
    it 'is invalid without a password_confirmation' do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    
    it 'is invalid without category' do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include('を入力してください')
    end
    
    it 'is invalid without  text' do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include('を入力してください')
    end
    
    it 'is invalid without a first_name_kana' do
      item = build(:item, first_name_kana: nil)
      item.valid?
      expect(item.errors[:first_name_kana]).to include('を入力してください')
    end
    
    it 'is invalid without a status' do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include('を入力してください')
    end
    
    
  
    it 'is invalid with a nickname that has more than 41 characters ' do
      name = "a" * 41
      item = build(:item, name: name)
      item.valid?
      expect(item.errors[:name]).to include('は40文字以内で入力してください')
    end
    
    it 'is valid with a text that has less than 1000 characters ' do
      text = "a" * 1000
      item = build(:item, text: text)
      expect(item).to be_valid
    end

    
    it 'is invalid with a password that has more than 129 characters ' do
      item = build(:item, password: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',password_confirmation:'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      item.valid?
      expect(item.errors[:password]).to include('は128文字以内で入力してください')
    end
    
    

    it 'is valid with all columns exist ' do
      item = build(:item)
      expect(item).to be_valid
    end
  
end
end