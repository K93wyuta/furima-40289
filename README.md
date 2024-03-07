# テーブル設計
## users
### テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :records_as_buyer, class_name: 'Records', foreign_key: :buyer_id
- has_many :records_as_seller, class_name: 'Records', foreign_key: :seller_id

## itemsテーブル
### テーブル
| Column       | Type                    | Options                       |
| ------------ | ----------------------- | ----------------------------- |
| (images)     | has_one_attachedにて実装 | null: false                   |
| name         | string                  | null: false                   |
| description  | text                    | null: false                   |
| category     | string                  | null: false                   |
| condition    | string                  | null: false                   |
| charge       | string                  | null: false                   |
| delivery_day | string                  | null: false                   |
| price        | integer                 | null: false                   |
| user         | references              | null: false,foreign_key: true |

### Association
- belongs_to :users
- has_one    :records

## recordsテーブル
### テーブル
| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| seller  | references | null: false,foreign_key:{ to_table: :users } |
| buyer   | references | null: false,foreign_key:{ to_table: :users } |
| item    | references | null: false,foreign_key: true                |
| address | references | null: false,foreign_key: true                |

### Association
- belongs_to :buyer, class_name: 'User'
- belongs_to :seller, class_name: 'User'
- belongs_to :items
- belongs_to :addresses

## addressesテーブル
### テーブル
| Column       | Type    | Options     |
| ------------ | ------- | ------------|
| postcode     | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| block        | string  | null: false |
| building     | string  | null: false |
| phone_number | integer | null: false |

### Association
- has_many   :records