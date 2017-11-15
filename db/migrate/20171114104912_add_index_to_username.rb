class AddIndexToUsername < ActiveRecord::Migration[5.1]
  def change
    add_index :usuarios, :username, unique: true
  end
end
