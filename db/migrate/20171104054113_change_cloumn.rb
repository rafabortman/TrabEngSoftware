class ChangeCloumn < ActiveRecord::Migration[5.1]
  change_table :jogadas do |t|
  t.change :data, :datetime
  end
end
