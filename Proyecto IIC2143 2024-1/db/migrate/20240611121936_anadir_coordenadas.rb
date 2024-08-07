class AnadirCoordenadas < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :salida_lat, :float
    add_column :posts, :salida_lng, :float
    add_column :posts, :llegada_lat, :float
    add_column :posts, :llegada_lng, :float
  end
end
