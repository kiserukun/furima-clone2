# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name.kana      | string | null: false |
| last_name.kana       | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| name               | string     | null: false                    |
| plice              | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| method_of_shipment | string     | null: false                    |
| ship_form          | string     | null: false                    |
| day_to_ship        | string     | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |

## Association

- belongs_to :history
- belongs_to :user

## orders テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| history_id      | integer | null: false, foreign_key: true |
| post_code       | string  | null: false                    |
| prefecture      | string  | null: false                    |
| city            | string  | null: false                    |
| address         | string  | null: false                    |
| building_name   | string  |                                |
| phone_number    | string  |                                |

### Association

- belongs_to :history

## histories テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |  
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

- has_one :order
- belongs_to :item
- belongs_to :user