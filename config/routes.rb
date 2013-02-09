Loopback::Application.routes.draw do
  root :to => 'welcome#index'
  resources :employees
  resources :sessions

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/logout', to: 'sessions#destroy'

  match ':controller(/:action(/:id))(.:format)'
end
