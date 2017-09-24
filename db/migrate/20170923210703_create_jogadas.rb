class CreateJogadas < ActiveRecord::Migration[5.1]
  def change
    create_table :jogadas do |t|
      t.string :texto_post
      t.string :plataforma
      t.date :data
      t.integer :tempo_horas
      t.integer :tempo_minutos
      t.integer :tempo_segundos
      t.string :categoria
      t.string :link
      t.references :usuario, foreign_key: true
      t.references :jogo, foreign_key: true

      t.timestamps
    end
  end
end
