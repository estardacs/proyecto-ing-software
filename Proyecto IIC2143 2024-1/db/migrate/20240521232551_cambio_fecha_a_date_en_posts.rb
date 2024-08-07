class CambioFechaADateEnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :fecha, 'date USING fecha::date'
  end
end