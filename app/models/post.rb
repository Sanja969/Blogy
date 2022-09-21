class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'Author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :counter

  def counter
    user.PostCounter.nil? ? user.PostCounter = 1 : user.PostCounter += 1
    user.update(PostCounter: user.PostCounter)
  end

  def recent_5_comments
    comments.last(5)
  end
end
