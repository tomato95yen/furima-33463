# テーブル設計

## users テーブル

| Colum               | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_kana    | string | null:false  |
| first_name_kana     | string | null:false  |
| birthday            | date   | null:false  |

### Association
- has_many :items
- has_many :user_items

## items テーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| shipping_charge_id | integer    | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| shipping_day_id    | integer    | null: false                   |
| item_price      | integer    | null: false                   |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_ons :user_item

## user_items テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :order
- belongs_to :user

## orders テーブル 

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| item_order       | references | null: false, foreign_key: true |

### Association
belongs_to :user_item



