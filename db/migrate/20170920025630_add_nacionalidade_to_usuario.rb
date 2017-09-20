class AddNacionalidadeToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :nacionalidade, :string
  end
end
