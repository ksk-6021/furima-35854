# データベース設計

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
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                       |
| --------------   | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| explain          | text       | null: false                   |
| category         | integer    | null: false                   |
| condition        | integer    | null: false                   |
| shipping_charges | integer    | null: false                   |
| shipping_area    | integer    | null: false                   | 
| shipping_time    | integer    | null: false                   |
| item_id          | integer    | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|


### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | integer    | null: false                   |
| prefecture     | integer    | null: false                   |
| city           | string     | null: false                   |
| address        | string     | null: false                   |
| building       | string     |                               |
| phone_number   | integer    | null: false                   |
| order          | references | null: false, foreign_key: true|

### Association

- belongs_to :order