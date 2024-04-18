# README

# user table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_reading  | string | null: false |
| first_name_reading | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## item table

| Column      | Type        | Options     |
| ----------- | ----------- | ----------- |
| image       | text        | null: false |
| title       | string      | null: false |
| introduction| text        | null: false |
| category_id | integer     | null: false |
| condition_id| integer     | null: false |
| fee_id      | integer     | null: false |
| place_id    | integer     | null: false |
| price       | integer     | null: false |
| user        | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## order table

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| address      | text       | null: false                    |
| building_name| text       | null: false                    |
| phone_number | string     | null: false,                   |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user