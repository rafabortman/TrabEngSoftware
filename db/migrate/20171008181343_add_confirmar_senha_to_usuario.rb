class AddConfirmarSenhaToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :confirmar_senha, :string
  end
end
