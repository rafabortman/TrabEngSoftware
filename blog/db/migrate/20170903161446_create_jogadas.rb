class CreateJogadas < ActiveRecord::Migration
  def change
    create_table :jogadas do |t|
      t.string :plataforma
      t.string :link
      t.date :data
      t.string :jogador
      t.string :jogo

      t.timestamps null: false
    end
  end
end
