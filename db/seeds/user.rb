user = User.create(
nickname: "Mario",
email: "test@test.test",
password: "testest",
password_confirmation: "testest",
first_name: "不離",
last_name: "真理雄",
first_name_kana: "フリ",
last_name_kana: "マリオ",
birthday: "1964-11-05",
phone_number: "09099009900")

Address.create(
  user: user.id,
  first_name: "不離",
  last_name: "真理雄",
  first_name_kana: "フリ",
  last_name_kana: "マリオ",
  prefecture_id: "7",
  city: "きのこ王国",
  house_number: "1-2",
  post_number: "470-1155",
  phone_number: "09099009900"
)