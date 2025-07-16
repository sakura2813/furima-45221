## テーブル設計

---

### ◼︎ Users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

**Association**

- has_many :items  
- has_many :orders  

---

### ◼︎ Items テーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false（ActiveHash）       |
| condition_id       | integer    | null: false（ActiveHash）       |
| shipping_fee_id    | integer    | null: false（ActiveHash）       |
| prefecture_id      | integer    | null: false（ActiveHash）       |
| shipping_day_id    | integer    | null: false（ActiveHash）       |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

**Association**

- belongs_to :user  
- has_one :order  

---

### ◼︎ Orders テーブル（購入記録）

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

**Association**

- belongs_to :user  
- belongs_to :item  
- has_one :address  

---

### ◼︎ Addresses テーブル（配送先）

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false（ActiveHash）       |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order_id       | references | null: false, foreign_key: true |

**Association**

- belongs_to :order  

---

## 補足

- クレジットカード情報は保存せず、PayJP等の外部サービスを利用してトークン化された情報で決済を行います。  
- `prefecture_id`、`category_id` などのカラムは ActiveHash を利用して管理します。

