class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: 'Author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :counter

  def counter
    user.update(PostCounter: user.PostCounter + 1)
  end

  def recent_5_comments
    comments.last(5)
  end
end
