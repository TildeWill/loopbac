Loopbac::Application.routes.draw do
  resource :calendar
  resource :contact
  resource :profiles
  resources :photos
  resources :plus_people
  resources :users
  resources :loops
  resources :loop_kickoffs
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'welcome#index'
end
