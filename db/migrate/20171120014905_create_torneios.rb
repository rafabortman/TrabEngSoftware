class CreateTorneios < ActiveRecord::Migration[5.1]
  def change
    create_table :torneios do |t|
      t.string :titulo
      t.datetime :data_inicio
      t.datetime :data_fim
      t.string :regras
      t.integer :jogo_id

      t.timestamps
    end
  end
end
