require 'rails_helper'
RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Tom',
      photo: 'https://www.flaticon.com/free-icon/cat_1998592?term=cat&page=1&position=1&origin=search&related_id=1998592',
      bio: 'Cat',
      posts_counter: 3
    )
    @user2 = User.create(
      name: 'Jerry',
      photo: 'https://www.flaticon.com/free-icon/mouse_375105?term=mouse&page=1&position=34&origin=search&related_id=375105',
      bio: 'Mouse',
      posts_counter: 0
    )
    visit root_path
  end
  it 'should have the username of all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end
  it 'should have the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://www.flaticon.com/free-icon/cat_1998592?term=cat&page=1&position=1&origin=search&related_id=1998592'
    and @alt = 'user photo']")
    assert page.has_xpath?("//img[@src = 'https://www.flaticon.com/free-icon/mouse_375105?term=mouse&page=1&position=34&origin=search&related_id=375105'
    and @alt = 'user photo']")
  end
  it 'should have the users number of posts' do
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 0')
  end
  it 'should redirect to that users show page on click' do
    click_link(@user1.name)
    expect(page).to have_current_path user_path(@user1.id)
  end
end
