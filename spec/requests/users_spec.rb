require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/l-T-LpQnNRg',
      bio: 'Awesome Writer'
    )
  end

  describe 'GET index' do
    it 'renders index' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders show ' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
end
