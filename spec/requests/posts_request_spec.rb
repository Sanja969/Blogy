require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET index' do
    before(:example) { get user_posts_path('1') }
    it 'Response status is correct.' do
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('A list of posts for a given user')
    end
  end
  describe 'GET show' do
    before(:example) { get user_post_path('1', '1') }
    it 'Response status is correct.' do
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('Here is the post for the user.')
    end
  end
end
