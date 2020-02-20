FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"試験"}
    last_name             {"単体"}
    first_name_kana       {"テスト"}
    last_name_kana        {"オリジン"}
    birthday              {"2019-03-02"}
    phone_number          {"09009876543"}
  end

end