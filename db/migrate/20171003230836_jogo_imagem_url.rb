class JogoImagemUrl < ActiveRecord::Migration[5.1]
  def change
	add_column :jogos, :imagem_url, :string
  end
end
