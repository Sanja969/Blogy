require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:all) do
    @user = User.create(Name: 'user1', Photo: 'some link', Bio: 'bio1')
    @post1 = Post.create(Title: 'Title1', Text: 'text for post', user: @user)
    @post2 = Post.create(Title: 'Title2', Text: 'text for post', user: @user)
    @post3 = Post.create(Title: 'Title3', Text: 'text for post', user: @user)
    @post4 = Post.create(Title: 'Title4', Text: 'text for post', user: @user)
  end

  describe 'index page' do
    it 'I can see the names of all other users.' do
      visit users_path
      expect(page).to have_content(@user.Name)
    end
    it 'I can see the profile picture for each user.' do
      visit users_path
      have_css("img[src*='#{@user.Photo}']")
    end

    it 'I can see the number of posts each user has written.' do
      visit users_path
      expect(page).to have_content(@user.PostCounter)
    end

    it 'When I click on a user, I am redirected to that user show page.' do
      visit users_path
      find("##{@user.Name}").click
      expect(page).to have_current_path(user_path(@user.id))
    end
  end

  describe 'show page' do
    it 'I can see the user username.' do
      visit user_path(@user.id)
      expect(page).to have_content(@user.Name)
    end
    it 'I can see the user profile picture.' do
      visit user_path(@user.id)
      have_css("img[src*='#{@user.Photo}']")
    end
    it 'I can see the number of posts the user has written.' do
      visit user_path(@user.id)
      expect(page).to have_content(@user.PostCounter)
    end
    it 'I can see the user bio.' do
      visit user_path(@user.id)
      expect(page).to have_content(@user.Bio)
    end
    it 'I can see the user first 3 posts.' do
      visit user_path(@user.id)
      expect(page).to have_content('Title2')
      expect(page).to have_content('Title3')
      expect(page).to have_content('Title4')
    end
    it 'I can see a button that lets me view all of a user posts.' do
      visit user_path(@user.id)
      expect(page).to have_link('See all posts')
    end
    it 'When I click a user post, it redirects me to that post show page.' do
      visit user_path(@user.id)
      find("##{@post2.id}").click
      expect(page).to have_current_path(user_post_path(@user.id, @post2.id))
    end
    it 'When I click to see all posts, it redirects me to the user post index page.' do
      visit user_path(@user.id)
      find('.posts-btn').click
      expect(page).to have_current_path(user_posts_path(@user.id))
    end
  end
end
