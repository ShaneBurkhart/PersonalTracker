class DailyTracker < ApplicationRecord
  TYPES = ["counter"]

  belongs_to :user
  has_many :daily_tracker_logs

  validates :tracker_type, :name, presence: true
  validates :tracker_type, inclusion: { in: TYPES }

  def do_action!(action)
    send("#{self.tracker_type}_action", action)
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

  private

    def counter_action(action)
      log = todays_log
      count = log.data["count"] || 0

      case action
        when 'increment'
          count += 1
        when 'decrement'
          count -= 1
      end

      log.data["count"] = count
      log.save
    end
end
