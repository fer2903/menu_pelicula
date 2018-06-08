class CreatePeliculas < ActiveRecord::Migration[5.1]
  def change
    create_table :peliculas do |t|
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
