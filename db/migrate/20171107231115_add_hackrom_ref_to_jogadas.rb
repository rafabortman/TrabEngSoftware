class AddHackromRefToJogadas < ActiveRecord::Migration[5.1]
  def change
    add_reference :jogadas, :hackrom, foreign_key: true
  end
end
