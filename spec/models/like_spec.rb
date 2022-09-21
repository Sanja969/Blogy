require 'rails_helper'

RSpec.describe 'Like', type: :model do
  user1 = User.create(Name: 'sanja', Photo: 'link', Bio: 'Teacher from Serbia.')
  post1 = Post.create(user: user1, Title: 'Post1', Text: 'Post 1')
  Like.create(user: user1, post: post1)

  it '#counter' do
    expect(post1.LikesCounter).to eql 1
    Like.create(user: user1, post: post1)
    expect(post1.LikesCounter).to eql 2
  end
end
