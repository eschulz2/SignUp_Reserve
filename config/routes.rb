Rails.application.routes.draw do
  root :to => "visitors#new"
  devise_for :users
  resources :users
  resources :visitors
  resources :events
  post "/seats" => 'seats#reserve_seat'
  post "/seats/cancel" => 'seats#cancel_reservation'
end
