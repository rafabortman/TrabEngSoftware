class CreatePontos < ActiveRecord::Migration[5.1]
  def change
    create_table :pontos do |t|
      t.references :jogada_id, foreign_key: true
      t.integer :nota

      t.timestamps
    end
  end
end
