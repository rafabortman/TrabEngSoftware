class CreateHackroms < ActiveRecord::Migration[5.1]
  def change
    create_table :hackroms do |t|
      t.string :nomeRom
      t.references :jogo, foreign_key: true

      t.timestamps
    end
  end
end
