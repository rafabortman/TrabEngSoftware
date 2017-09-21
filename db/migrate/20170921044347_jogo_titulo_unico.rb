class JogoTituloUnico < ActiveRecord::Migration[5.1]
  def change
    change_column :Jogos, :titulo, :string, unique: true
  end
end
