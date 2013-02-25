Loopbac::Application.routes.draw do

  resources :loops
  resources :loop_kickoffs
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'welcome#index'
end
