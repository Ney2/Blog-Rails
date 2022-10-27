class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def comments_counter
    comments.count
  end

  def recent_updates
    comments.last(5)
  end
end
