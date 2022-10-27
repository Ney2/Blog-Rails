class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, foreign_key: { to_table: :users }
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
