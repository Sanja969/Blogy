class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'Author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def recent_3_posts
    posts.last(3)
  end
end
