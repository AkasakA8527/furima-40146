# FURIMAのテーブル設計

## usersテーブル

| Column             | Type      | Options                   |
| ------------------ | --------- | ------------------------- |
| email              | string    | null: false, unique: true |
| encrypted_password | string    | null: false               |
| name               | string    | null: false               |
| occupation         | text      | null: false               |
| age      | integer | null: false |

### Association
- has_many :sale_items
- has_many :purchase_intentions

## sale_itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| spec | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :purchase_intentions

## purchase_intentionsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| price   | integer       | null: false                    |
| user   | reference       | null: false, foreign_key: true                    |
| sale_item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :sale_item

## descriptionテーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| address   | string     | null: false                   |
| purchase_intention | references | null: false, foreign_key: true |