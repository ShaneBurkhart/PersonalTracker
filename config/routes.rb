Rails.application.routes.draw do
  root :to => redirect('/dashboard')

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get "/sign_in" => "user#sign_in"

  get "/dashboard" => "dashboard#index"
  get "/dashboard/tracker/new" => "dashboard#new_tracker", as: :new_tracker
  post "/dashboard/trackers" => "dashboard#create_tracker", as: :trackers
  post "/dashboard/:tracker_id/update" => "dashboard#update_tracker"
end
