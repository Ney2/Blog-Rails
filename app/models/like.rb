class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
    author.increment!(:likes_counter)
  end
end
