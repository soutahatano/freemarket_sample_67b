FactoryBot.define do

  factory :delivery do
    item_id               {create(:item).id}
    deliverycharge_id     {1}
    deliveryday_id        {1}
    prefecture_id         {1}
  end
end