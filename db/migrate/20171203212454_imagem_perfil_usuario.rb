class ImagemPerfilUsuario < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :imagem_perfil, :string
  end
end
