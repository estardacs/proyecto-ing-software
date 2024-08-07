class RemoveColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :id_auto, :integer
    remove_column :users, :id_viaje, :integer
  end
end
