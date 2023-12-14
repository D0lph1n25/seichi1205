## usersテーブル

| Column                  | Type           | Options                               |
|------------------------ | -------------- | ------------------------------------- |
| nickname                | string         | null: false                           |
| email                   | string         | null: false, unique: true             |
| encrypted_password      | string         | null: false                           |
| last_name               | string         | null: false                           |
| first_name              | string         | null: false                           |
| last_name_kana          | string         | null: false                           |
| first_name_kana         | string         | null: false                           |
| birthday                | date           | null: false                           |

### Association
- has_many :places
- has_many :comments
- has_many :favorites


## placesテーブル

| Colum                       | Type            | Options                        |
| --------------------------- | --------------- | ------------------------------ |
| title                   | string          | null: false                    |
| introduction                   | text            | null: false                    |
| category_id            | integer         | null: false                    |
| prefecture_id               | integer         | null: false                    |
| user                        | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## favoritesテーブル

| Colum           | Type            | Options                        | 
| --------------- | --------------- | ------------------------------ |
| favorite        | integer         |                                |
| user            | references      | null: false, foreign_key: true |
| place           | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :place


## commentsテーブル

| Colum           | Type            | Options                        |
| --------------- | --------------- | ------------------------------ |
| comment         | string          | null: false                    |
| user            | references      | null: false, foreign_key: true |
| place           | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :place
