# newRead

概要


## Description
詳細の説明



## Usage
用途


## Install
インストール方法


#半角スペースの場合

新しいページです。(半角スペース２回)

設定手順は以下のようになります。


#brタグの場合

新しいページです。<br>

設定手順は以下のようになります。


















# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# README

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
