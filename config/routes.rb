Rails.application.routes.draw do
  root :to => redirect('/dashboard')

  #devise_for :users
end
