class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  validates :Name, presence: true
  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy, foreign_key: 'Author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def recent_3_posts
    posts.order('created_at').last(3)
  end
end
