FactoryBot.define do

  factory :delivary do
user                  {create(:user.id)}
item                  {create(:item.id)}
delivery_charge       {"着払い"}
delivery_day           {"2~3日"}
  end
end