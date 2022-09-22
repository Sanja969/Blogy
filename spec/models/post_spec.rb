require 'rails_helper'

RSpec.describe 'Post', type: :model do
  user1 = User.create(Name: 'sanja', Photo: 'link', Bio: 'Teacher from Serbia.')
  subject = Post.create(user: user1, Title: 'Post1', Text: 'Post 1')

  before { subject.save }
  it 'Title should be present' do
    expect(subject.Title).present?
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCount should be integer greater or equal to zero' do
    expect(subject.CommentsCounter).to be >= 0
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCount should be integer greater or equal to zero' do
    expect(subject.LikesCounter).to be >= 0
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

  it '#counter' do
    expect(user1.PostCounter).to eql 1
  end

  it '#recent_5_comments' do
    subject.CommentsCounter = 0
    Comment.create(user: user1, post: subject, Text: 'Comment 1')
    Comment.create(user: user1, post: subject, Text: 'Comment 2')
    Comment.create(user: user1, post: subject, Text: 'Comment 3')
    Comment.create(user: user1, post: subject, Text: 'Comment 4')
    Comment.create(user: user1, post: subject, Text: 'Comment 5')
    Comment.create(user: user1, post: subject, Text: 'Comment 6')
    expect(subject.recent_5_comments.pop.Text).to eql 'Comment 6'
  end
end
