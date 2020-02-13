class Item < ApplicationRecord
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
  has_many :images, dependent: :destroy
end
