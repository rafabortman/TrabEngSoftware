class JogoGenero < ActiveRecord::Migration[5.1]
  def change
      create_table :jogos_generos do |t|
      t.belongs_to :jogo, index: true
      t.belongs_to :genero, index: true
      t.timestamps
    end
  end
end
