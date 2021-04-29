class AddColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event, :text, null: false, default: ''
    add_index :events, :event, unique: true
  end
end
