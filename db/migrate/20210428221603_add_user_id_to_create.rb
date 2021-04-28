class AddUserIdToCreate < ActiveRecord::Migration[6.1]
  def change
    add_column :creates, :user_id, :integer
  end
end
