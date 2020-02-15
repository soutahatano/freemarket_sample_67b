FactoryBot.define do
  factory :picture do
    item_id {create(:item).id}
    picture {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end
end
