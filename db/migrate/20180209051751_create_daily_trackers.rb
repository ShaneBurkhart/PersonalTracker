class CreateDailyTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_trackers do |t|
      t.string :tracker_type, null: false
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :daily_trackers, [:user_id, :tracker_type]
    add_index :daily_trackers, :tracker_type
    add_index :daily_trackers, :user_id
  end
end
