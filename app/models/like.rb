class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'author_id'

  def likes_counter
    likes.count
  end
end
