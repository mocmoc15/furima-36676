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
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column          | Type      | Options                   |
| --------------- | --------- | ------------------------- |
| item_name       | string    | null: false               |
| explanation     | text      | null: false               |
| category        | string    | null: false               |
| statue          | string    | null: false               |
| shipping_cost   | string    | null: false               |
| shipment_source | string    | null: false               |
| time_to_ship    | string    | null: false               |
| price           | string    | null: false               |
| user            |references | foreign_key: true         |


### Association

- has_one :purchase_records
- belongs_to :users

## purchase_records テーブル

| Colu             | Type       | Options           |
| ---------------- | ---------- | ------------------|
| buyer            | string     | null: false       |
| item             | references | foreign_key: true |
| shipping_address | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :items
- has_one :shipping_addresses

## shipping_addresses テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ------------------|
| postal_code        | string    | null: false       |
| prefecture         | string    | null: false       |
| municipality       | string    | null: false       |
| address            | string    | null: false       |
| building           | string    |                   |
| telephone_number   | string    | null: false       |
| purchase_record    |references | foreign_key: true |

### Association

- has_one :purchase_record
