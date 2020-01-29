# userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e_mail|string|null: false|
|password|string|null: false|
|name|string|null: false|
|birthday|date|null: false|
|credit_number|string|null: false|
|phone_number|string|null: false|
|post_number|string|null: false|
|pref|string|null: false, foreign_key: true|
|profile|text||
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
## Association
- belongs_to :pref
- has_many :comments
- has_many :goods

# prefテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to:user

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|goods|reference|null: false, foreign_key: true|
|text|string||
## Association
- belongs_to :user
- belongs_to :goods

# goodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|img_id|reference|null: false, foreign_key: true|
|categories_id|string|null: false, foreign_key: true|
|status|string|foreign_key: true|
|price|integer|null: false|
|brand_id|string|foreign_key: true|
|user_id|reference|null: false|
## Association
- has_many :delivery
- has_many :comments
- belongs_to :img
- belongs_to :categories
- belongs_to :status
- belongs_to :brand

# statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to :goods

# deliveryテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|delivery_charge|integer|null: false, foreign_key: true|
|delivery_days|integer|null: false, foreign_key: true|
|delivery_way|string|null: false, foreign_key: true|
|delivery_date|datetime|null: false, foreign_key: true|
|goods_id|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :goods
- belongs_to :delivery_charge
- belongs_to :delivery_days
- belongs_to :delivery_way
- belongs_to :Entity

# delivery_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
## Association
- belongs_to :delivery

# delivery_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
## Association
- belongs_to :delivery

# delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|
## Association
- belongs_to :delivery

# delivery_wayテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to :delivery

# delivery_dateテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
## Association
- belongs_to :delivery

