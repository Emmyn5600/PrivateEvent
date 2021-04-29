class AddNewColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :title, :string, null: false
    add_column :events, :date, :datetime, null: false
    add_column :events, :location, :string, null: false
    add_column :events, :creator_id, :integer
    remove_column :events, :user_id, :integer
  end
end
