class AddSalidaToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :salida, :string
  end
end
