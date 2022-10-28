class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    author.update(PostsCounter: author.posts.count)
  end

  def latest_five_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
