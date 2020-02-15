class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :deliveryday
  belongs_to_active_hash :prefecture

  belongs_to :item
  belongs_to :user, optional: true

  validates :deliverycharge_id,     presence: true
  validates :deliveryday_id,        presence: true
  validates :prefecture_id,         presence: true
  validates :item_id,               presence: true
end
