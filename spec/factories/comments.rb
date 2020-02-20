FactoryBot.define do

  factory :comment do
    item_id               {create(:item).id}
    text                  {"ac"}
    user_id               {create(:user).id}
  end
end