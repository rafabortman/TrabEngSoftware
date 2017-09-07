class CreateJogadas < ActiveRecord::Migration[5.1]
  def change
    create_table :jogadas do |t|
      t.string :plataforma
      t.date :data
      t.string :link
      t.string :jogador
      t.string :jogo

      t.timestamps
    end
  end
end
