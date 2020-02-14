class Item < ApplicationRecord
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
  has_many :images, dependent: :destroy

belongs_to :delivery
has_many :comments
has_many :pictures
belongs_to :category
belongs_to :status
belongs_to :brand
has_many :favorites
validates :name,             presence: true, length:{maximum: 40}
validates :name,             presence: true, length:{maximum: 1000}
validates :price,            presence: true
validates :category,         presence: true
validates :status,           presence: true
end  