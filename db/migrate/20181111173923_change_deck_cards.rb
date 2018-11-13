class ChangeDeckCards < ActiveRecord::Migration[5.2]
  def change
    change_table :deck_cards do |t|
      t.column :card_id, :integer
      t.column :deck_id, :integer
    end
  end
end
