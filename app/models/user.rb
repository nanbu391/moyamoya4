class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :empathys, dependent: :destroy
  has_many :empathed_posts, through: :empathys, source: :post
  has_many :cheers, dependent: :destroy
  has_many :cheered_posts, through: :cheers, source: :post

  def already_empathed?(post)
    self.empathys.exists?(post_id: post.id)
  end
  
  def already_cheered?(post)
    self.cheers.exists?(post_id: post.id)
  end
end
