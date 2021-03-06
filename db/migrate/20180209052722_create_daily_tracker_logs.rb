class CreateDailyTrackerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_tracker_logs do |t|
      t.json :data, default: {}
      t.integer :daily_tracker_id, null: false

      t.timestamps
    end

    add_index :daily_tracker_logs, :daily_tracker_id
  end
end
