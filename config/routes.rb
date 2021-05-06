Rails.application.routes.draw do
  devise_for :users,  :controllers  => { registrations: 'registrations' }
  root "events#index"
  resources :events
  resources :event_attendees, only: [:create, :destroy]
  get 'user/:id', to: 'user#show', as: :user
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
