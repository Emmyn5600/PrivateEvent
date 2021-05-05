Rails.application.routes.draw do
  devise_for :users,  :controllers  => { registrations: 'registrations' }
  root "events#index"
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :event_attendees, only: [:create, :destroy]
end
