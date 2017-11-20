class CreateJogadaTorneios < ActiveRecord::Migration[5.1]
  def change
    create_table :jogada_torneios do |t|
      t.integer "usuario_id"
      t.integer "torneio_id"
      t.string "link"
      t.timestamps
    end
  end
end
