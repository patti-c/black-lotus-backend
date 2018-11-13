class ChangeCards < ActiveRecord::Migration[5.2]
  def change
    change_table :cards do |t|
      t.column :artist, :string
      t.column :flavor, :string
      t.column :imageUrl, :string
      t.column :manaCost, :string
      t.column :originalType, :string
      t.column :rarity, :string
      t.column :setName, :string
    end
  end
end
