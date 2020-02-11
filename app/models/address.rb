class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  VALID_POST_REGEX = /\A\d{3}[-]\d{4}\z/

  validates :last_name,             presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,            presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,        presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana,       presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :prefecture_id,         presence: true
  validates :city,                  presence: true
  validates :house_number,          presence: true
  validates :post_number,           presence: true, format: { with: VALID_POST_REGEX  }
  validates :phone_number,          format: { with: VALID_PHONE_REGEX  }, allow_blank: true

end