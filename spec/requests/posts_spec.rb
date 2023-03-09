require 'rails_helper'

RSpec.describe 'Posts', type: :controller do
  before(:each) do
    before :each do
      @user = User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/l-T-LpQnNRg',
        bio: 'Awesome Writer'
      )
      @post = Post.create(user: @user, title: 'title', text: 'text')
    end

    describe 'GET index' do
      it 'renders index' do
        get :index, params: { user_id: @user.id }
        expect(response.status).to eq(200)
        expect(response).to render_template('index')
      end
    end
    describe 'GET show' do
      it 'renders show' do
        get :show, params: { id: @post.id, user_id: @user.id }
        expect(response.status).to eq(200)
      end
      # If a correct template was rendered.
      it 'renders the show template' do
        user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'Awesome Writter')
        post = Post.create(title: 'My First Post', text: 'Hello World', author: user)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response).to render_template(:show)
      end
      # If the response body includes correct placeholder text.
      it 'includes the correct placeholder text in the response body' do
        user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'Awesome Writter')
        post = Post.create(title: 'My First Post', text: 'Hello World', author: user)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response.body).to include(post.title)
        expect(response.body).to include(post.text)
      end
    end
  end
end
