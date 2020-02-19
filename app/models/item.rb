class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures

  belongs_to :category
  belongs_to :user
  # belongs_to :brand
  has_one :delivery
  has_many :comments
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  
  validates :name,             presence: true, length:{maximum: 40}
  validates :text,             presence: true, length:{maximum: 1000}
  validates :price,            presence: true
  validates :status_id,        presence: true
  validates :soldout,          presence: true
  validates :user_id,          presence: true
  validates :category_id,      presence: true

  def favorite?(user)
    favorite_users.include?(user)
  end

end  