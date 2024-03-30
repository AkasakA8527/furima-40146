# FURIMAのテーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name_kanji  | string | null: false               |
| first_name_kanji   | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday_year      | date   | null: false               |
| birthday_month     | date   | null: false               |
| birthday_day       | date   | null: false               |

### Association
- has_many :sale_items
- has_many :purchase_intentions

## sale_itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| whopay_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| shipdays_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_intention

## purchase_intentionsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| sale_item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :sale_item
- has_one :purchase_description

## purchase_descriptionテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip                | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street_number      | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_intention | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_intention