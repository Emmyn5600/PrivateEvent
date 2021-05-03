Rails.application.routes.draw do
  get 'user/show'
  devise_for :users,  :controllers  => { registrations: 'registrations' }
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
end
