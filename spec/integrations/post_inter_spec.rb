require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:all) do
    @user1 = User.create(Name: 'user', Photo: 'some link', Bio: 'bio')
    @user2 = User.create(Name: 'user', Photo: 'some link', Bio: 'bio')
    @post1 = Post.create(Title: 'Title1', Text: 'text for post', user: @user1)
    @post2 = Post.create(Title: 'Title2', Text: 'text for post', user: @user1)
    @post3 = Post.create(Title: 'Title3', Text: 'text for post', user: @user1)
    @post4 = Post.create(Title: 'Title4', Text: 'text for post', user: @user1)
    @comment1 = Comment.create(Text: 'text for comment', user: @user2, post: @post2)
  end

  describe 'index page' do
    it 'I can see the user name.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.Name)
    end
    it 'I can see the user profile picture.' do
      visit user_posts_path(@user1.id)
      have_css("img[src*='#{@user1.Photo}']")
    end

    it 'I can see the number of posts the user has written..' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.PostCounter)
    end

    it 'I can see a posts title.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@post2.Title)
    end

    it 'I can see a posts body.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@post2.Text)
    end

    it 'I can see the first comments on a post.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@post2.comments.first.Text)
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@post2.CommentsCounter)
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@post2.CommentsCounter)
    end

    it 'I can see a section for see more button.' do
      visit user_posts_path(@user1.id)
      expect(page).to have_button('Show more')
    end
    it 'When I click on a post, it redirects me to that post show page.' do
      visit user_posts_path(@user1.id)
      find("##{@post1.id}").click
      expect(page).to have_current_path(user_post_path(@user1.id, @post1.id))
    end
  end

  describe 'show page' do
    it 'I can see the post title.' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content(@post1.Title)
    end
    it 'I can see who wrote the post.' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content(@user1.Name)
    end
    it 'I can see how many comments it has.' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content(@post1.CommentsCounter)
    end
    it 'I can see how many likes it has.' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content(@post1.LikesCounter)
    end
    it 'I can see the post body.' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content(@post1.Text)
    end
    it 'I can see the username of each commentor.' do
      visit user_post_path(@user1.id, @post1.id)
      @post1.comments.each do |comment|
        expect(page).to have_content(User.find(comment.Author_id).Name)
      end
    end
    it 'I can see the comment each commentor left."' do
      visit user_post_path(@user1.id, @post1.id)
      @post1.comments.each do |comment|
        expect(page).to have_content(comment.Text)
      end
    end
  end
end
