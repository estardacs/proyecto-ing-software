class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :id_publicacion
      t.references :user, null: false, foreign_key: true
      t.boolean :vigente
      t.string :pref_genero
      t.string :fecha
      t.string :hora
      t.integer :cupos
      t.string :campus
      t.boolean :auto
      t.string :llegada
      t.string :comuna

      t.timestamps
    end
  end
end
