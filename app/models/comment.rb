class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'Author_id'
  belongs_to :post, foreign_key: 'Post_id'

  after_save :counter

  def counter
    post.update(CommentsCounter: post.CommentsCounter + 1)
  end
end
