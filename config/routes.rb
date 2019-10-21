Rails.application.routes.draw do
  resources :usertickets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :events
  # resources :tickets
  resources :usertickets 

  resources :events , shallow: true do
    resources :tickets
  end

  post 'authenticate', to: 'authentication#authenticate'
  get 'get-all-events', to: 'events#all_events'
  post 'filtered-events', to: 'events#filtered_events'
  get 'user-info', to: 'events#user_info'
end
