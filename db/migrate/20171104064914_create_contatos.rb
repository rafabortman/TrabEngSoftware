class CreateContatos < ActiveRecord::Migration[5.1]
  def change
    create_table :contatos do |t|
      t.string :email
      t.string :assunto
      t.text :corpo

      t.timestamps
    end
  end
end
