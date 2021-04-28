class CreateCreates < ActiveRecord::Migration[6.1]
  def change
    create_table :creates do |t|
      t.string :Event
      t.string :title
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
