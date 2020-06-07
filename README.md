
# README　このアプリについて  
  
  
## ![概要](https://github.com/nanbu391/moyamoya4/blob/master/1f4dd@2x.png)概要
 ・アプリ名:ポチッと支え〜る  
 
 ・使用言語・開発環境：HTML/CSS/Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code  
 
 ・機能：ログイン機能、投稿機能、編集機能、削除機能、共感・応援ボタン機能


## URL
### URL:

URL：http://3.113.185.115/

Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。

🔒ID&Pass

- ID: mercari64j
- Pass:6464
📝テスト用アカウント

💰購入者アカウント

- メール：buyer_user@gmail.com
- パスワード: buyer_user


## 機能詳細
#### -トップページ-
マイページで投稿一覧を見ることができます。いつ誰が投稿したのか、共感数・応援数などを確認することができます。  
また、ここから投稿ページに飛べます。  
![demo](https://gyazo.com/a12fe81d40347eb3947136aac0b35b5e)  

#### -ログイン機能-
名前、メールアドレス、パスワード（再確認）を入力して新規ユーザー登録ができます。  
一度登録した後は、ログアウトした場合に再度メールアドレスとパスワードを入力することでログインできます。  
https://gyazo.com/0985997685c168919236736f338ec91a  
https://gyazo.com/20219370380df28d3085d7be2478cf25  

#### -投稿機能-  
投稿するボタンを押し、投稿内容を記載後に投稿ボタンを押すと、トップページに反映されます。  
https://gyazo.com/029d2cc3b52045d2d63a06d22c12ea77  

#### -編集機能-  
投稿内容を修正したい時は、編集ボタンを押すと編集できます。  
https://gyazo.com/a66e10b863a80487ad6c53af6cb4ddf5  

#### -削除機能-  
削除ボタンを押すと、投稿記事が削除されます。  
https://gyazo.com/5e639b4d45d1ed69c8139999d10790ed

#### -共感・応援ボタン機能-
「共感できる」「応援したい」と思った投稿に対しては共感ボタンや応援ボタンを押すことで追加されて行きます。
誰が押してくれたかも確認することができます。  
https://gyazo.com/27e70cf544763e96ac2f9d2eb7d9ce6e  

#### -並び替え機能（新しい/古い投稿、共感数/応援数が多い投稿）-  
投稿が増えてきた時は、並び替えを行うことで、投稿が見やすくなります。  
https://gyazo.com/97e808940ca6e1540795ea154ae1b119  

#### -並び替え機能（タグ）-
タグを選択することで、見たいカテゴリの投稿が見れます。  
https://gyazo.com/8951060adc88a968e92706a9faef3126  

#### -検索機能-  
検索ワードを入力することで、検索したい語が入った投稿のみが表示されます。  
https://gyazo.com/ce21c665b5e0e040104f777c2406cdc1





## 制作背景
コンセプトは
①日々の生活で、相談するほどではないけど、悶々としながら思っている事、誰かと分かち合いたい事を、ツイッターのように簡単に投稿できる。
②投稿を見た人がそれに共感したり応援したりすることで、その気持ちを少しでも軽くする。
です。
また、個人アプリの制作を通して、フロントからサーバーサイドまでの技術理解を満遍なく深めるために作成しました。

### 用途
・工夫したポイント
・課題や今後実装したい機能






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
