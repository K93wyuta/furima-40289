# テーブル設計
## userモデル
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

## itemモデル
### テーブル
| Column          | Type                    | Options                       |
| --------------- | ----------------------- | ----------------------------- |
| (image)        | has_one_attachedにて実装 | null: false                   |
| name            | string                  | null: false                   |
| description     | text                    | null: false                   |
| category_id     | integer                 | null: false                   |
| condition_id    | integer                 | null: false                   |
| charge_id       | integer                 | null: false                   |
| prefecture_id   | integer                 | null: false                   |
| delivery_day_id | integer                 | null: false                   |
| price           | integer                 | null: false                   |
| user            | references              | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one    :record

  extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category
- belongs_to :condition
- belongs_to :charge
- belongs_to :prefecture
- belongs_to :delivery_day

## recordモデル
### テーブル
| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| buyer   | references | null: false,foreign_key:{ to_table: :users } |
| item    | references | null: false,foreign_key: true                |

### Association
- belongs_to :buyer, class_name: 'User'
- belongs_to :item

## addressモデル
### テーブル
| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| postcode      | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| block         | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| record        | references | null: false,foreign_key: true |

### Association
- belongs_to :prefecture

## ActiveHash
### categoryモデル
class Category < ActiveHash::Base
 self.data = [
   { id: 1, name: "---" },
   { id: 2, name: "レディース" },
   { id: 3, name: "メンズ" },
   { id: 4, name: "ベビー・キッズ" },
   { id: 5, name: "インテリア・住まい・小物" },
   { id: 6, name: "本・音楽・ゲーム" },
   { id: 7, name: "おもちゃ・ホビー・グッズ" },
   { id: 8, name: "家電・スマホ・カメラ" },
   { id: 9, name: "スポーツ・レジャー" },
   { id: 10, name: "ハンドメイド" },
   { id: 11, name: "その他" }
 ]

  include ActiveHash::Associations
  has_many :items

 end

 ### conditionモデル
class Condition < ActiveHash::Base
 self.data = [
   { id: 1, name: "---" },
   { id: 2, name: "新品・未使用" },
   { id: 3, name: "未使用に近い" },
   { id: 4, name: "目立った傷や汚れなし" },
   { id: 5, name: "やや傷や汚れあり" },
   { id: 6, name: "傷や汚れあり" },
   { id: 7, name: "全体的に状態が悪い" }
 ]

  include ActiveHash::Associations
  has_many :items

 end

 ### chargeモデル
class Charge < ActiveHash::Base
 self.data = [
   { id: 1, name: "---" },
   { id: 2, name: "着払い（購入者負担）" },
   { id: 3, name: "送料込み（出品者負担）" }
 ]

  include ActiveHash::Associations
  has_many :items

 end

  ### prefectureモデル
class Prefecture < ActiveHash::Base
 self.data = [
   { id: 1, name: "---" },
   { id: 2, name: "北海道" },
   { id: 3, name: "青森県" },
   { id: 4, name: "岩手県" },
   { id: 5, name: "宮城県" },
   { id: 6, name: "秋田県" },
   { id: 7, name: "山形県" },
   { id: 8, name: "福島県" },
   { id: 9, name: "茨城県" },
   { id: 10, name: "栃木県" },
   { id: 11, name: "群馬県" },
   { id: 12, name: "埼玉県" },
   { id: 13, name: "千葉県" },
   { id: 14, name: "東京都" },
   { id: 15, name: "神奈川県" },
   { id: 16, name: "新潟県" },
   { id: 17, name: "富山県" },
   { id: 18, name: "石川県" },
   { id: 19, name: "福井県" },
   { id: 20, name: "山梨県" },
   { id: 21, name: "長野県" },
   { id: 22, name: "岐阜県" },
   { id: 23, name: "静岡県" },
   { id: 24, name: "愛知県" },
   { id: 25, name: "三重県" },
   { id: 26, name: "滋賀県" },
   { id: 27, name: "京都府" },
   { id: 28, name: "大阪府" },
   { id: 29, name: "兵庫県" },
   { id: 30, name: "奈良県" },
   { id: 31, name: "和歌山県" },
   { id: 32, name: "鳥取県" },
   { id: 33, name: "島根県" },
   { id: 34, name: "岡山県" },
   { id: 35, name: "広島県" },
   { id: 36, name: "山口県" },
   { id: 37, name: "徳島県" },
   { id: 38, name: "香川県" },
   { id: 39, name: "愛媛県" },
   { id: 40, name: "高知県" },
   { id: 41, name: "福岡県" },
   { id: 42, name: "佐賀県" },
   { id: 43, name: "長崎県" },
   { id: 44, name: "熊本県" },
   { id: 45, name: "大分県" },
   { id: 46, name: "宮崎県" },
   { id: 47, name: "鹿児島県" },
   { id: 48, name: "沖縄県" }
 ]

  include ActiveHash::Associations
  has_many :items
  has_many :addresses
 end

 ### delivery_dayモデル
class Delivery_day < ActiveHash::Base
 self.data = [
   { id: 1, name: "---" },
   { id: 2, name: "1~2日で発送" },
   { id: 3, name: "2~3日で発送" },
   { id: 4, name: "4~7日で発送" }
 ]

  include ActiveHash::Associations
  has_many :items

 end