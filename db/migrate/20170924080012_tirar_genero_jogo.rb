class TirarGeneroJogo < ActiveRecord::Migration[5.1]
  def change
	remove_column :jogos, :genero
  end
end
