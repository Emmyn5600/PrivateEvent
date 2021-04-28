class AddTimestampToCreates < ActiveRecord::Migration[6.1]
  def change
    add_column :creates, :date, :timestamp
    add_column :creates, :user_id, :integer
    remove_column :creates, :Event
    add_column :users, :username, :string, unique: true
  end
end
