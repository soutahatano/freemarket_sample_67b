require 'rails_helper'
describe Credit, type: :model  do
  describe '#create' do

  it 'is valid with all columns exist ' do
    credit = build(:credit)
    expect(credit).to be_valid
  end

  it 'is invalid without a name' do
    credit = build(:credit, user_id: '')
    credit.valid?
    expect(credit.errors[:user_id]).to include('を入力してください')
  end

  it 'is invalid without a text' do
    credit = build(:credit, customer_id: '')
    credit.valid?
    expect(credit.errors[:customer_id]).to include('を入力してください')
  end

  it 'is invalid without a price' do
    credit = build(:credit, card_id: '')
    credit.valid?
    expect(credit.errors[:card_id]).to include('を入力してください')
  end

 end
end