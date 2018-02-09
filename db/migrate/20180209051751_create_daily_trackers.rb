class CreateDailyTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_trackers do |t|
      t.string :tracker_type, null: false
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
