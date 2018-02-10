class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_trackers = current_user.daily_trackers
  end

  def new_tracker
    @tracker = DailyTracker.new
  end

  def create_tracker
    @tracker = DailyTracker.new(params.require(:tracker).permit(:name, :tracker_type))
    @tracker.user_id = current_user.id

    if @tracker.save
      redirect_to dashboard_path
    else
      render :new_tracker
    end
  end

  def tracker_action
    @daily_tracker = DailyTracker.where(id: params[:tracker_id]).first
    redirect_to dashboard_path if @daily_tracker.nil?

    @daily_tracker.do_action!(params[:tracker_action])

    redirect_to dashboard_path(anchor: "daily_tracker_#{@daily_tracker.id}")
  end
end
