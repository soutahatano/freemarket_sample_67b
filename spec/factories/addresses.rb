FactoryBot.define do

  factory :address do
    first_name            {"試験"}
    last_name             {"単体"}
    first_name_kana       {"テスト"}
    last_name_kana        {"オリジン"}
    post_number           {"012-3456"}
    prefecture            {"愛知県"}
    city                  {"浜松市"}
    house_number          {"tyuig"}
    phone_number          {"09009876543"}
    user_id               {1}
  end

end