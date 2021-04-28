class RemoveEmailIndex < ActiveRecord::Migration[6.1]
  def change
    remove_column :creates, :index_users_on_email
  end
end
