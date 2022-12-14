require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'index page' do
    before(:each) do
      visit users_path
      @users = User.all
    end

    it 'should see the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'should see profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'should see the number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content(user.post_counter)
      end
    end

    it 'should redirect to user\'s show page when clicking on a user' do
      @users.each do |user|
        expect(page).to have_link('More info', href: user_path(user))
      end
    end
  end
end
