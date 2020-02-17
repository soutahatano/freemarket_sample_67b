# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|reference||
## Association
- has_many :items

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category|reference|null: false|
## Association
- has_many :items

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e_mail|string|null: false,unique: true|
|password|string|null: false|
|birthday|date|null: false|
|phone_number|string|null: false|
|profile|text||
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
## Association
- has_many :comments
- has_many :items
- has_many :favorites
- has_one  :credit
- has_one  :address

# address
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|string|null: false|
|prefcture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
|phone_number|string||
|user|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to_active_hash :prefecture


# credits
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|user|reference|null: false, foreign_key: true|
## Association
- belongs_to :user

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|text|string|null: false|
## Association
- belongs_to :user
- belongs_to :item

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|text|string|null: false|
|soldout|string|foreign_key: true,null false|
|brand|reference|null: false,foreign_key: true|
|price|integer|null: fgalse|
|category|reference|null: false,foreign_key: true|
|user|reference|null:false,foreign_key: true|
## Association
- belongs_to :delivery
- has_many :comments
- has many :imgs
- belongs_to :category
- belongs_to :status
- belongs_to :brand
- has_many :favorites

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|text|string|null: false|
## Association
- belongs_to :user
- belongs_to :item

# deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|deliveryday_id|integer|null: false|
|deliveryday_id|integer|null: false|
|prefecture_id|integer|null: false|
## Association
- belongs_to :user
- belongs_to :item

# favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false,foreign_key: true|
|item|reference|null: false,foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item

# credits
|Column|Type|Options|
|------|----|-------|
|credit_number|string|null: false|
|user|reference|null: false, foreign_key: true|
## Association
- belongs_to :user

# address
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|string|null: false|
|prefcture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
|phone_number|string||
|user|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to_active_hash :prefecture

# picturesテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true|
|picture|string|null: false|
## Association
- has_many :items









