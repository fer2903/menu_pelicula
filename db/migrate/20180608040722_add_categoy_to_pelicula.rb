class AddCategoyToPelicula < ActiveRecord::Migration[5.1]
  def change
  	add_reference :peliculas, :category, index: true, foreign_key: true
  end
end
