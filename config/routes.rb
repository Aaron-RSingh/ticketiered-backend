Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :events
  resources :tickets 

  # resources :events , shallow: true do
  #   resources :tickets
  # end

  post 'authenticate', to: 'authentication#authenticate'
  get 'get-all-events', to: 'events#all_events'
  get 'user-info', to: 'events#user_info'
end
