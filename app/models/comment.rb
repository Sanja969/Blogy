class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'Author_id'
  belongs_to :post, foreign_key: 'Post_id'

  def counter
    post.CommentsCounter.nil? ? post.CommentsCounter = 1 : post.CommentsCounter += 1
    post.update(CommentsCounter: post.CommentsCounter)
  end
end
