class CreateTrip < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
