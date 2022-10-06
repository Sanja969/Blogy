class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: 'Author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'Post_id'
  has_many :likes, dependent: :destroy, foreign_key: 'Post_id'

  after_create :counter_inc
  after_destroy :counter_dec

  def counter_inc
    user.update(PostCounter: user.PostCounter + 1)
  end

  def counter_dec
    user.update(PostCounter: user.PostCounter - 1)
  end

  def recent_5_comments
    comments.order('created_at').last(5)
  end
end
