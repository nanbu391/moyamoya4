
# README　このアプリについて
・アプリ名：ポチッと支え〜る

# 概要
## ・アプリ名
## ・使用言語・開発環境：HTML/CSS/Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code
## ・機能：ログイン機能、投稿機能、編集機能、削除機能、共感・応援ボタン機能、


# URL
## URL:

URL：http://3.113.185.115/

Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。

🔒ID&Pass

- ID: mercari64j
- Pass:6464
📝テスト用アカウント

💰購入者アカウント

- メール：buyer_user@gmail.com
- パスワード: buyer_user


# 機能詳細
## 〜トップページ〜

## 〜ログイン機能〜

## 〜投稿機能〜

## 〜編集機能〜

## 〜削除機能〜

## 〜共感・応援ボタン機能〜

# 制作背景
## フリーマーケットアプリの制作を通してフロントからサーバーサイドまでの技術理解を満遍なく深めるために作成した。

### 用途

### 工夫したポイント
### 課題や今後実装したい機能










#半角スペースの場合

新しいページです。  

設定手順は以下のようになります。


#brタグの場合

新しいページです。<br>

設定手順は以下のようになります。


# 見出し名(h1)

## 見出し名(h2)

### 見出し名(h3)

#### 見出し名(h4)

##### 見出し名(h5)

[文章](リンク先のURL)






# DB設計

## empathiesテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## cheersテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :posts
- has_many :empathys, dependent: :destroy
- has_many :empathed_posts, through: :empathys, source: :post
- has_many :cheers, dependent: :destroy
- has_many :cheered_posts, through: :cheers, source: :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|content|text|

### Association
- belongs_to :user
- has_many :post_tags, dependent: :destroy
- has_many :tags, through: :post_tags
- has_many :empathys
- has_many :empathed_users, through: :empathys, source: :user
- has_many :cheers
- has_many :cheered_users, through: :cheers, source: :user

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|foreign_key: true|
|tag|references|foreign_key: true|

### Association
- belongs_to :post
- belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|

### Association
- has_many :post_tags, dependent: :destroy
- has_many :posts, through: :post_tags
