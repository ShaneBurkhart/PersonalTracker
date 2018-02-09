class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to sign_in_path if current_user.nil?
  end
end
