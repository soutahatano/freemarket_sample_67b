class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'category_id', dependent: :destroy
  belongs_to :parent, class_name: 'Category', foreign_key: 'category_id', optional: :true
end
