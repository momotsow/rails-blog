require 'rails_helper'
RSpec.describe 'Users-show', type: :feature do
  describe 'users show' do
    before(:each) do
      @user_one = User.create! name: 'Tom', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'Awesome Reader',
                               posts_counter: 4
      @user_two = User.create! name: 'Jerry', photo: 'https://unsplash.com/photos/l-T-LpQnNRg', bio: 'Awesome Writter',
                               posts_counter: 4
      visit(user_path(@user_one.id))
    end
    scenario "can see the user's profile picture" do
      expect(page).to have_selector('div')
    end
    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('Tom')
    end
    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content(/#{Regexp.escape('Number of posts: 4')}/i)
    end
    scenario "I can see the user's bio." do
      expect(page).to have_content('Awesome Reader')
    end
    scenario "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content 'See all posts'
    end
    scenario "When I click a user's post, it redirects me to that post's show page" do
      visit(user_posts_path(@user_one.id))
      expect(page).to have_current_path user_posts_path(@user_one.id)
    end
    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user_one)
    end
  end
end
