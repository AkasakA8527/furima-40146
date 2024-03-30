# FURIMAのテーブル設計

## usersテーブル

| Column                | Type      | Options                   |
| --------------------- | --------- | ------------------------- |
| nickname              | string    | null: false               |
| email                 | string    | null: false, unique: true |
| encrypted_password    | string    | null: false               |
| password_confirmation | string    | null: false               |
| family_name_kanji     | string    | null: false               |
| first_name_kanji      | string    | null: false               |
| family_name_kana      | string    | null: false               |
| first_name_kana       | string    | null: false               |
| birthday_year         | integer   | null: false               |
| birthday_month        | integer   | null: false               |
| birthday_day          | integer   | null: false               |

### Association
- has_many :sale_items
- has_many :purchase_intentions

## sale_itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | image/jpeg | null: false                    |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | text       | null: false                    |
| who_pay_freight | string     | null: false                    |
| origin_region   | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | decimal    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_intentions

## purchase_intentionsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| sale_item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :sale_item
- has_one :description

## purchase_descriptionテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| ZIP                   | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| street_number         | string     | null: false                    |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| purchase_intention_id | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_intention