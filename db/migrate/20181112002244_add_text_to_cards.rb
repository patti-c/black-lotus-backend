class AddTextToCards < ActiveRecord::Migration[5.2]
  def change
    change_table :cards do |t|
      t.column :text, :string
    end
  end
end
