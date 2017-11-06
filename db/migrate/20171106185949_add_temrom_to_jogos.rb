class AddTemromToJogos < ActiveRecord::Migration[5.1]
  def change
    add_column :jogos, :temrom, :boolean
  end
end
