class AddMilissegundosToJogadas < ActiveRecord::Migration[5.1]
  def change
    add_column :jogadas, :milissegundos, :bigint
    remove_column :jogadas, :tempo_horas
    remove_column :jogadas, :tempo_minutos
    remove_column :jogadas, :tempo_segundos
  end
end
