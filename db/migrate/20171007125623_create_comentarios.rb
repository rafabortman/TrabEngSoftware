class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.references :jogada, foreign_key: true
      t.string :comentario

      t.timestamps
    end
  end
end
