Loopbac::Application.routes.draw do
  resources :feedback
  resources :meta_feedback
  resources :rankings do
    post 'sort', on: :collection
  end

  namespace :admin do
    resource :settings, only: [:edit, :update]
  end
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'dashboard#index'
end
