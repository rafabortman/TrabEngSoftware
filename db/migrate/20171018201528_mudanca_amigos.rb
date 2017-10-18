class MudancaAmigos < ActiveRecord::Migration[5.1]
  def change
	 remove_column :amigos, :usuarioId
	 remove_column :amigos, :amigoId
	 add_reference :amigos, :usuario
	 add_reference :amigos, :amigo
	 add_foreign_key :amigos, :usuarios, column: :usuario_id, primary_key: :id
         add_foreign_key :amigos, :usuarios, column: :amigo_id, primary_key: :id
  end
end
