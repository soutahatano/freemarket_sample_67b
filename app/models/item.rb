class Item < ApplicationRecord
  has_many :pictures, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status

  belongs_to :category
  belongs_to :user
  has_one :delivery, dependent: :destroy
  has_many :comments
  has_many :favorites
  has_many :comments
  validates :name,             presence: true, length:{maximum: 40}
  validates :text,             presence: true, length:{maximum: 1000}
  validates :price,            presence: true
  validates :status_id,        presence: true
  validates :soldout,          presence: true
  validates :user_id,          presence: true
  validates :category_id,      presence: true

end  