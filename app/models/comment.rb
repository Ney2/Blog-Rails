class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'author_id'

  def comments_counter
    comments.count
  end
end
