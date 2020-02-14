FactoryBot.define do

  factory :item do
      name              {"abc"}
      price              {0000}
      text                {"abcd"}
      category          {create(:category.id)}
      status            {"新品"}
      brand             {create(:brand.id)}
      user               {create(:user.id)}
      boolean            {"true"}
      
  end
end