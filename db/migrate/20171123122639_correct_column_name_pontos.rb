class CorrectColumnNamePontos < ActiveRecord::Migration[5.1]
  def change
    rename_column :pontos, :jogada_id_id, :jogada_id
  end
end
