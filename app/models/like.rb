class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'Author_id'
  belongs_to :post, foreign_key: 'Post_id'

  def counter
    post.LikesCounter.nil? ? post.LikesCounter = 1 : post.LikesCounter += 1
    post.update(LikesCounter: post.LikesCounter)
  end
end
