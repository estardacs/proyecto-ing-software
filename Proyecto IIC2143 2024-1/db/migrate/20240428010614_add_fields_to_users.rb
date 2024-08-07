class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :n_tuc, :string
    add_column :users, :nombre_usuario, :string
    add_column :users, :genero, :string
    add_column :users, :id_auto, :integer
    add_column :users, :id_viaje, :integer
  end
end
