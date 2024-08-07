class ChangeDefaultValueForIdAutoAndIdViaje < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :id_auto, from: nil, to: ""
    change_column_default :users, :id_viaje, from: nil, to: ""
  end
end
