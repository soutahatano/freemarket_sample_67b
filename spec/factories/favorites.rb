FactoryBot.define do

  factory :favorite do
    user_id              {create(:user).id}
    item_id              {create(:item).id}
  end
end