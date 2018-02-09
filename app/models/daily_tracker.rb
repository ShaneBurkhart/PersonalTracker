class DailyTracker < ApplicationRecord
  TYPES = ["counter"]

  belongs_to :user
  has_many :daily_tracker_logs

  validates :tracker_type, :name, presence: true
  validates :tracker_type, inclusion: { in: TYPES }

  def update_todays_log!
  end

  def todays_log
    beginning = Date.today.to_time.beginning_of_day
    end_of_day = Date.today.to_time.end_of_day

    log = DailyTrackerLog.where(daily_tracker_id: self.id, created_at: beginning..end_of_day).first

    unless log
      log = DailyTrackerLog.create(daily_tracker_id: self.id)
    end

    log
  end
end
