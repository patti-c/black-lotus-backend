class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.column :username, :string
      t.column :password_digest, :string
      t.remove :name
    end
  end
end
