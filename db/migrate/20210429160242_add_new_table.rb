class AddNewTable < ActiveRecord::Migration[6.1]
  def change
    create_table :evuser do |t|
      t.integer "atendee_id", null: false
      t.integer "attended_event_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
