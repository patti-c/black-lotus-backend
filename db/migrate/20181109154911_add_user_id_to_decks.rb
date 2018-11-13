class AddUserIdToDecks < ActiveRecord::Migration[5.2]
  def change
    change_table :decks do |t|
      t.column :user_id, :integer
    end
  end
end
