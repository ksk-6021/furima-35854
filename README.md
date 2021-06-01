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
| item_id          | integer    | null: false                   |
| price            | string     | null: false                   |
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
| postal_code    | string     | null: false                   |
| prefecture     | string     | null: false                   |
| city           | string     | null: false                   |
| address        | string     | null: false                   |
| building       | string     | null: false                   |
| phone_number   | string     | null: false                   |
| order          | references | null: false, foreign_key: true|

### Association

- belongs_to :order