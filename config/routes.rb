Rails.application.routes.draw do
  root :to => redirect('/dashboard')

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get "/sign_in" => "user#sign_in"

  get "/dashboard" => "dashboard#index"
  get "/dashboard/tracker/new" => "dashboard#new_tracker", as: :new_tracker
  post "/dashboard/trackers" => "dashboard#create_tracker", as: :daily_trackers
  get "/dashboard/:tracker_id/:tracker_action" => "dashboard#tracker_action", as: :tracker_action
end
