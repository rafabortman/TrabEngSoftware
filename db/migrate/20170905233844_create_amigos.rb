class CreateAmigos < ActiveRecord::Migration[5.1]
  def change
    create_table :amigos do |t|
      t.string :usuarioId
      t.string :amigoId

      t.timestamps
    end
  end
end
