class ChangeCreatesUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :creates, :index_users_on_email, :integer
    remove_column :creates, :used_id
  end
end
