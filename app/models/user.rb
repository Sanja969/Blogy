class User < ApplicationRecord
  validates :Name, presence: true
  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy, foreign_key: 'Author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def recent_3_posts
    sorted = posts.order('created_at DESC')
    sorted.last(3)
  end
end
