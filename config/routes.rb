Loopbac::Application.routes.draw do
  resources :feedback
  resources :meta_feedback
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'dashboard#index'
end
