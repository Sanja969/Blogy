require 'rails_helper'

RSpec.describe 'User', type: :model do
  subject = User.create(Name: 'sanja', Photo: 'link', Bio: 'Teacher from Serbia.')

  before { subject.save }
  it 'Name should be present' do
    expect(subject.Name).present?
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostCount should be integer greater or equal to zero' do
    expect(subject.PostCounter).to be >= 0
    subject.PostCounter = -1
    expect(subject).to_not be_valid
  end

  it '#recent_3_posts' do
    subject.PostCounter = 0
    Post.create(user: subject, Title: 'post1', Text: 'Post 1')
    Post.create(user: subject, Title: 'post2', Text: 'Post 2')
    Post.create(user: subject, Title: 'post3', Text: 'Post 3')
    Post.create(user: subject, Title: 'post4', Text: 'Post 4')
    expect(subject.recent_3_posts.length).to eql 3
    expect(subject.recent_3_posts.pop.Title).to eql 'post4'
  end
end
