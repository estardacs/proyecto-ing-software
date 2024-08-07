class AddColumnToTrip < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :chat, index: true, foreign_key: true
  end
end
