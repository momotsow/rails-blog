require 'rails_helper'
RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/l-T-LpQnNRg',
      bio: 'Hi, I am Tom!',
      posts_counter: 0
    )
    @user2 = User.create(
      name: 'John Smith',
      photo: 'https://unsplash.com/photos/l-T-LpQnNRg',
      bio: 'Hi, I am John!',
      posts_counter: 0
    )
    visit root_path
  end
  it 'should have the username of all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end
  it 'should have the users number of posts' do
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 0')
  end
  it 'should redirect to that users show page on click' do
    visit(user_path(@user1.id))
    expect(page).to have_content(@user1.bio) 
  end
end
