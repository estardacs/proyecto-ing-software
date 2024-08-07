class ModifyReviewsTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :post, null: false, foreign_key: true
    add_reference :reviews, :reviewer, null: false, foreign_key: { to_table: :users }
    add_reference :reviews, :reviewed_user, null: false, foreign_key: { to_table: :users }
  end
end