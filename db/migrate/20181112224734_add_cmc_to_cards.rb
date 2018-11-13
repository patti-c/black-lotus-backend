class AddCmcToCards < ActiveRecord::Migration[5.2]
  def change
    change_table :cards do |t|
      t.column :cmc, :integer
    end
  end
end
