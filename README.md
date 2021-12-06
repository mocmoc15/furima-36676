# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| statue_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| time_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| buyer            | string     | null: false                    |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false                    |
| prefecture_id      | integer   | null: false                    |
| municipality       | string    | null: false                    |
| address            | string    | null: false                    |
| building           | string    |                                |
| telephone_number   | string    | null: false                    |


### Association

- has_one :purchase_record
