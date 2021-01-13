# テーブル設計

## users テーブル

| Colum     | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null:false  |
| birthday  | date   | null:false  |

### Association
- has_many :products

## products テーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category           | integer    | null: false                   |
| condition          | integer    | null: false                   |
| shipping_charge    | integer    | null: false                   |
| shipping_area      | integer    | null: false                   |
| shipping_days      | integer    | null: false                   |
| product_price      | integer    | null: false                   |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_ons :history

## histories テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| history   | boolean    | null: false                    |
| purchaser | integer    | null: false                    |
| product   | references | null: false, foreign_key: true |

### Association
belongs_to :product
has_one :address

## addresses テーブル 

| Colum        | Type    | Options     |
| ------------ | ------- | ----------- |
| address      | text    | null: false |
| phone_number | integer | null: false |
| purchaser    | integer | null: false |

### Association
belongs_to :history



