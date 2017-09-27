class AddDescricaoJogo < ActiveRecord::Migration[5.1]
  def change
	add_column :jogos, :descricao, :string
  end
end
