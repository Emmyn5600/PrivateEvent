class AddColumnsToUsersAndEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :events, :user_id, :integer
  end
end
