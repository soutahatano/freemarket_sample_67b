FactoryBot.define do
  factory :credit do
    customer_id       {"abc"}
    user_id           {create(:user).id}
    card_id           {"false"}
  end
end