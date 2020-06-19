
# README　このアプリについて  
  
  
## ![概要](https://github.com/nanbu391/moyamoya4/blob/master/1f4dd@2x.png)概要
 ・アプリ名:ポチッと支え〜る  
 
 ・使用言語・開発環境：HTML/CSS/Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code  
 
 ・機能：ログイン機能、投稿機能、編集機能、削除機能、共感・応援ボタン機能、並び替え機能


## URL  
https://lit-caverns-85503.herokuapp.com


## 機能詳細
#### -トップページ-
マイページで投稿一覧を見ることができます。いつ誰が投稿したのか、共感数・応援数などを確認することができます。  
また、ここから投稿ページに飛べます。  
[![Image from Gyazo](https://i.gyazo.com/a12fe81d40347eb3947136aac0b35b5e.gif)](https://gyazo.com/a12fe81d40347eb3947136aac0b35b5e)

#### -ログイン機能-
名前、メールアドレス、パスワード（再確認）を入力して新規ユーザー登録ができます。  
一度登録した後は、ログアウトした場合に再度メールアドレスとパスワードを入力することでログインできます。  
[![Image from Gyazo](https://i.gyazo.com/0985997685c168919236736f338ec91a.gif)](https://gyazo.com/0985997685c168919236736f338ec91a)
[![Image from Gyazo](https://i.gyazo.com/20219370380df28d3085d7be2478cf25.gif)](https://gyazo.com/20219370380df28d3085d7be2478cf25)

#### -投稿機能-  
投稿するボタンを押し、投稿内容を記載後に投稿ボタンを押すと、トップページに反映されます。  
[![Image from Gyazo](https://i.gyazo.com/029d2cc3b52045d2d63a06d22c12ea77.gif)](https://gyazo.com/029d2cc3b52045d2d63a06d22c12ea77)  

#### -編集機能-  
投稿内容を修正したい時は、編集ボタンを押すと編集できます。  
[![Image from Gyazo](https://i.gyazo.com/a66e10b863a80487ad6c53af6cb4ddf5.gif)](https://gyazo.com/a66e10b863a80487ad6c53af6cb4ddf5)

#### -削除機能-  
削除ボタンを押すと、投稿記事が削除されます。  
[![Image from Gyazo](https://i.gyazo.com/5e639b4d45d1ed69c8139999d10790ed.gif)](https://gyazo.com/5e639b4d45d1ed69c8139999d10790ed)

#### -共感・応援ボタン機能-
「共感できる」「応援したい」と思った投稿に対しては共感ボタンや応援ボタンを押すことで追加されていきます。
誰が押してくれたかも確認することができます。  
[![Image from Gyazo](https://i.gyazo.com/27e70cf544763e96ac2f9d2eb7d9ce6e.gif)](https://gyazo.com/27e70cf544763e96ac2f9d2eb7d9ce6e)

#### -並び替え機能（新しい/古い投稿、共感数/応援数が多い投稿）-  
投稿が増えてきた時は、並び替えを行うことで、投稿が見やすくなります。  
[![Image from Gyazo](https://i.gyazo.com/8951060adc88a968e92706a9faef3126.gif)](https://gyazo.com/8951060adc88a968e92706a9faef3126) 

#### -並び替え機能（タグ）-
タグを選択することで、見たいカテゴリの投稿が見れます。  
[![Image from Gyazo](https://i.gyazo.com/97e808940ca6e1540795ea154ae1b119.gif)](https://gyazo.com/97e808940ca6e1540795ea154ae1b119)

#### -検索機能-  
検索ワードを入力することで、検索したい語が入った投稿のみ表示することができます。  
[![Image from Gyazo](https://i.gyazo.com/ce21c665b5e0e040104f777c2406cdc1.gif)](https://gyazo.com/ce21c665b5e0e040104f777c2406cdc1)


## 制作背景
コンセプトは
①日々の生活で、相談するほどではないけど、悶々としながら思っている事、誰かと分かち合いたい事を、ツイッターのように簡単に投稿できる。  
②投稿を見た人がそれに共感したり応援したりすることで、それを見た投稿者の気持ちを少しでも軽くする。  
です。  
また、個人アプリの制作を通して、フロントからサーバーサイドまでの技術理解を満遍なく深めるために作成しました。

## 用途
・工夫したポイント
　マイナスな感情に対する投稿なので、「いいね」ではなく、共感ボタンや応援ボタンにすることで、より励ましている感じが伝わるようにしました。
  並び替えができるようにすることで、自分の見たいジャンルの投稿だけを見つけたり、投稿がより見やすくなるようにしました。  
・課題や今後実装したい機能
　メーターです。投稿時はモヤモヤ度が100%ですが、共感や応援の数が増えるほど、その度合い下がっていくといったメーターのような機能が実装できたら可視化できて面白いかなと思いました。


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
