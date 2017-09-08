class CreateJogos < ActiveRecord::Migration[5.1]
  def change
    create_table :jogos do |t|
      t.string :titulo
      t.string :genero
      t.string :imagem

      t.timestamps
    end
  end
end
