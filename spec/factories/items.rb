FactoryBot.define do

  factory :item do
    name              {"abc"}
    price             {300}
    text              {"abcd"}
    category_id       {create(:category).id}
    status_id         {1}
    user_id           {create(:user).id}
    soldout           {"false"}
  end
end