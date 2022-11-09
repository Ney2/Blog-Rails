require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(
        name: 'Kidist',
        photo: 'https://unsplash.com/photos',
        bio: 'Teacher from Mexico.',
        post_counter: 0
      )
      @post1 = Post.create(title: 'Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                           author_id: @user)
      Comment.create(author_id: @user, post: @post1, text: 'This is my first comment')
      @user = User.all
      visit(user_posts_path(@user.ids))
    end

    it 'should see the username of all other users' do
      @user.each do |user|
        expect(user.name).to have_content('Kidist')
      end
    end

    it 'should see profile picture for each user' do
      @user.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'should see the number of posts each user has written' do
      expect(page).to have_content(@user.first.post_counter)
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content(@post1.comments.first)
    end

    it 'should display post body.' do
      expect(page).to have_content('List of user posts')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it "should display post's title." do
      expect(page).to have_content('List of user posts')
    end

    it 'should have a pagination button' do
      expect(page).to have_selector(:link_or_button, 'pagination')
    end
  end
end
