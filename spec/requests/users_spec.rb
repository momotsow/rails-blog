require 'rails_helper'

RSpec.describe UsersController, type: :request do
  before(:all) do
    @first_user = User.create(name: 'happen', photo: 'photo', bio: 'test')
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

  # If the response body includes correct placeholder text.
  it 'displays the correct user' do
    get user_path(user)
    expect(response.body).to include(user.name)
    expect(response.body).to include(user.photo)
    expect(response.body).to include(user.bio)
  end
end
