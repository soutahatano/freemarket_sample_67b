class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture

  belongs_to :item
  belongs_to :user, optional: true

  validates :delivery_charge_id,     presence: true
  validates :delivery_day_id,        presence: true
  validates :prefecture_id,          presence: true
end
