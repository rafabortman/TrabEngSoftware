class CreateAmigos < ActiveRecord::Migration
  def change
    create_table :amigos do |t|
      t.string :usuarioId
      t.string :amigoId

      t.timestamps null: false
    end
  end
end
