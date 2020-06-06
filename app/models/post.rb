class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :empathys
  has_many :empathed_users, through: :empathys, source: :user
  has_many :cheers
  has_many :cheered_users, through: :cheers, source: :user

  def self.search(search)
      return Post.all unless search
      Post.where(['content LIKE ?', "%#{search}%"])
    end

  def self.order_by_empathy
    Post.select('posts.*', 'count(empathies.id) AS empathy')
    .left_joins(:empathys)
    .group('posts.id')
    .order('empathy desc')
  end

  def self.order_by_cheer
    Post.select('posts.*', 'count(cheers.id) AS cheer')
    .left_joins(:cheers)
    .group('posts.id')
    .order('cheer desc')
  end
end
