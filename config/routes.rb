Rails.application.routes.draw do
  devise_for :users,  :controllers  => { registrations: 'registrations' } 
  resources :events
  root "events#index"

  get "/users/:id", to: "users#show", :as => :user_show
  resources :event_attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
