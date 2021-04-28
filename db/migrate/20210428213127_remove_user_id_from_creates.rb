class RemoveUserIdFromCreates < ActiveRecord::Migration[6.1]
  def change
    remove_column :creates, :user_id
  end
end
