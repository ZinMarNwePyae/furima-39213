# テーブル設計

## users テーブル

| Column                    | Type   | Options                  |
| ------------------        | ------ | -----------              |
| nickname                  | string | null: false              |
| email                     | string | null: false, unique: true|
| encrypted_password        | string | null: false              |
| last_name                 | string | null: false              |
| first_name                | string | null: false              |
| last_name_kana            | string | null: false              |
| first_name_kana           | string | null: false              |
| date_of_birth             | date   | null: false              |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column                    | Type      | Options                       |
| ------------------        | ------    | -----------                   |
| user                      | references| null: false, foreign_key:true |
| name                      | string    | null: false                   |
| description               | text      | null: false                   |
| category_id               | integer   | null: false                   |
| product_status_id         | integer   | null: false                   |
| shipping_fee_id           | integer   | null: false                   |
| prefecture_id             | integer   | null: false                   |
| shipping_duriation_id     | integer   | null: false                   |
| price                     | integer   | null: false                   |


### Association

- belong_to :user
- has_one   :order
- has_many  :comments

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :payment

## payments テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| order         | references |null: false, foreign_key:true   |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |

### Association

- belongs_to :order

## comments テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key:true  |
| item          | references | null: false, foreign_key: true |
| text          | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
