require 'rails_helper'

describe User, type: :model do
  describe '#create' do

    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end
    
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end
    
    it 'is invalid without a password_confirmation' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    
    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('を入力してください')
    end
    
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('を入力してください')
    end
    
    it 'is invalid without a first_name_kana' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include('を入力してください')
    end
    
    it 'is invalid without a last_name_kana' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include('を入力してください')
    end
    
    it 'is invalid without a birthday' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include('を入力してください')
    end
    
    it 'is invalid without a phone_number' do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include('を入力してください')
    end
  
    it 'is invalid with a nickname that has more than 21 characters ' do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaaa')
      user.valid?
      expect(user.errors[:nickname]).to include('は20文字以内で入力してください')
    end
    
    it 'is valid with a nickname that has less than 20 characters ' do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaa')
      expect(user).to be_valid
    end

    it 'is invalid without a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end
    
    it 'is invalid with a password that has more than 129 characters ' do
      user = build(:user, password: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',password_confirmation:'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      user.valid?
      expect(user.errors[:password]).to include('は128文字以内で入力してください')
    end
    
    it 'is valid with a password that has less than 128 characters ' do
      user = build(:user, password: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',password_confirmation:'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect(user).to be_valid
    end
    
    it 'is invalid with a password that has less than 6 characters ' do
      user = build(:user, password: 'aaaaaa')
      user.valid?
      expect(user.errors[:password]).to include('は7文字以上で入力してください')
    end
    
    it 'is valid with a password that has more than 7 characters ' do
      user = build(:user, password: 'aaaaaaa',password_confirmation:'aaaaaaa')
      expect(user).to be_valid
    end

    it 'is valid with all columns exist ' do
      user = build(:user)
      expect(user).to be_valid
    end
    
  end
end