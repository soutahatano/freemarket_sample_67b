# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e_mail|string|null: false,unique|
|password|string|null: false|
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
- has_many :items
- has_many :favorites

# prefsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has many:users

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|text|string||
## Association
- belongs_to :user
- belongs_to :item

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category|string|null: false, foreign_key: true|
|status|reference|foreign_key: true,null false|
|price|integer|null: false|
|brand|reference|foreign_key: true|
|user|reference|null: false,foreign_key: true|
|soldout|booling|default: "false"|
## Association
- belongs_to :delivery
- has_many :comments
- has many :imgs
- belongs_to :category
- belongs_to :status
- belongs_to :brand
- has_many :favorites
# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to :item
# statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to :item
# deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|delivery_charge|integer|null: false, foreign_key: true|
|delivery_day|integer|null: false, foreign_key: true|
|delivery_way|string|null: false, foreign_key: true|
|delivery_date|datetime|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery_charge
- belongs_to :delivery_day
- belongs_to :delivery_way


# delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
## Association
- belongs_to :delivery

# delivery_chargesテーブル
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

# delivery_waysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- belongs_to :delivery

# delivery_datesテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
## Association
- belongs_to :delivery
# favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false,foreign_key: true|
|item|reference|null: false,foreign_key: true|
## Association
- belongs_to :user
- belongs_to :item


