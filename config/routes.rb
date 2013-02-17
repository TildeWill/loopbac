Loopbac::Application.routes.draw do

  resources :circles
  match "/auth/:provider" => "sessions#create"
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  namespace :google do
    resources :contacts
  end

  root :to => 'welcome#index'
end
