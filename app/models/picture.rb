class Picture < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :item

  validates :item_id,          presence: true
  validates :picture,          presence: true
end