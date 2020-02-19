class Comment < ApplicationRecord
  belongs_to :item  # tweetsテーブルとのアソシエーション
  belongs_to :user
  validates :text, presence: true
end
